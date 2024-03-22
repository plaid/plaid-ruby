require_relative "test_helper"
require "date"

# Internal: The test for Plaid::Statements.
class PlaidStatementsTest < PlaidTest
  def test_full_flow # rubocop:disable Metrics/MethodLength
    create_item initial_products: [:statements]

    # 1. /statements/list
    response = poll_for_statements_list(access_token)
    refute_empty(response.accounts)
    refute_empty(response.accounts[0].statements)
    assert_kind_of(Plaid::StatementsListResponse, response)

    # 2. /statements/download
    response.accounts.each do |account|
      account.statements.each do |statement|
        statements_download_request = Plaid::StatementsDownloadRequest.new
        statements_download_request.access_token = access_token
        statements_download_request.statement_id = statement.statement_id

        file, status_code, headers = client.statements_download_with_http_info(statements_download_request)
        assert_equal(status_code, 200)
        assert_equal(headers["content-type"], "application/pdf")

        sha = Digest::SHA2.new
        File.open(file.path) do |f|
          while chunk = f.read(256) # only load 256 bytes at a time
            sha << chunk
          end
        end

        assert_equal(headers["plaid-content-hash"], sha.hexdigest)
      end
    end

    # 3. /statements/refresh
    statements_refresh_request = Plaid::StatementsRefreshRequest.new
    statements_refresh_request.access_token = access_token
    statements_refresh_request.start_date = Date.today.prev_year
    statements_refresh_request.end_date = Date.today.prev_month(10)

    response = client.statements_refresh(statements_refresh_request)
    assert_kind_of(Plaid::StatementsRefreshResponse, response)
    refute_empty(response.request_id)

    # 4. /statements/list
    response = poll_for_statements_list(access_token)
    refute_empty(response.accounts)
    refute_empty(response.accounts[0].statements)
    assert_kind_of(Plaid::StatementsListResponse, response)
  end
end

def poll_for_statements_list(access_token)
  response = nil
  10.times do
    begin
      statements_list_request = Plaid::StatementsListRequest.new
      statements_list_request.access_token = access_token
      response = @client.statements_list(statements_list_request)
      break
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      raise e if json_response["error_code"] != "PRODUCT_NOT_READY"
      sleep 1
    end
  end
  assert response, "Timed out while waiting for statements list"
  response
end
