module Plaid
  # Public: Class used to call the CreditDetails product.
  class CreditDetails
    def initialize(client)
      @client = client
    end

    # Public: Get information about all available credit_details
    #
    # Does a POST /credit_details/get call which fetches credit details associated with
    # and access_token's item
    #
    # access_token - access_token who's item to fetch credit_details for
    # account_ids  - Specific account ids to fetch credit_details for (optional)
    #
    # Returns the CreditDetailsResponse object with credit details info.
    def get(access_token, account_ids: nil)
      options_payload = {}
      options_payload[:account_ids] = account_ids unless account_ids.nil?
      payload = {
        access_token: access_token,
        options: options_payload
      }

      CreditDetailsResponse.new(
        @client.post_with_auth('credit_details/get', payload))
    end
  end

  # Public: Response wrapper for /credit_details/get.
  class CreditDetailsResponse < Models::BaseResponse
    property :accounts, coerce: Array[Models::Account]
    property :credit_details, coerce: Array[Models::CreditDetails]
    property :item, coerce: Models::Item
  end
end
