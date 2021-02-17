require_relative "test_helper"

class PlaidDepositSwitchTest < PlaidTest
  # rubocop:disable Metrics/MethodLength
  def test_all_routes
    # import item
    item_import_request = Plaid::ItemImportRequest.new

    item_import_request.products = %w[identity auth]
    item_import_request.user_auth = {
      user_id: "user_good",
      auth_token: "pass_good",
    }

    import_response = client.item_import(
      item_import_request
    )

    refute_empty(import_response.access_token)
    access_token = import_response.access_token
    assert_kind_of(Plaid::ItemImportResponse, import_response)

    # get account id
    accounts_get_request = Plaid::AccountsGetRequest.new
    accounts_get_request.access_token = access_token

    get_accounts_response = client.accounts_get(accounts_get_request)
    refute_empty(get_accounts_response.accounts)
    assert_kind_of(Plaid::AccountsGetResponse, get_accounts_response)

    depository_accounts = get_accounts_response.accounts.select do |account|
      account.type == "depository"
    end
    account_id = depository_accounts[0].account_id

    # create deposit switch
    deposit_switch_create_request = Plaid::DepositSwitchCreateRequest.new
    deposit_switch_create_request.target_account_id = account_id
    deposit_switch_create_request.target_access_token = access_token

    create_response = client.deposit_switch_create(
      deposit_switch_create_request
    )
    assert_kind_of(Plaid::DepositSwitchCreateResponse, create_response)

    refute_empty(create_response.deposit_switch_id)
    deposit_switch_id = create_response.deposit_switch_id

    # get deposit switch
    deposit_switch_get_request = Plaid::DepositSwitchGetRequest.new()
    deposit_switch_get_request.deposit_switch_id = deposit_switch_id

    get_response = client.deposit_switch_get(deposit_switch_get_request)
    assert_kind_of(Plaid::DepositSwitchGetResponse, get_response)

    refute_empty(get_response.deposit_switch_id)
    refute_empty(get_response.target_item_id)
    refute_empty(get_response.target_account_id)
    refute_empty(get_response.state)
    refute_nil(get_response.date_created)

    # create deposit switch token
    deposit_switch_create_token_request = Plaid::DepositSwitchTokenCreateRequest.new
    deposit_switch_create_token_request.deposit_switch_id = deposit_switch_id

    create_token_response = client.deposit_switch_token_create(deposit_switch_create_token_request)

    refute_empty(create_token_response.deposit_switch_token)
    refute_empty(create_token_response.deposit_switch_token_expiration_time)
  end
end

# rubocop:enable Metrics/MethodLength