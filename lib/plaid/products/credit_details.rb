module Plaid
  # Public: Class used to call the CreditDetails product.
  class CreditDetails < BaseProduct
    # Public: Get information about all available credit_details.
    #
    # Does a POST /credit_details/get call which fetches credit details
    # associated with an access_token's item.
    #
    # access_token - access_token of an item to fetch credit details for.
    # account_ids  - Specific account ids to fetch credit details for
    #                (optional).
    #
    # Returns the CreditDetailsResponse object with credit details info.
    def get(access_token, account_ids: nil)
      post_with_auth 'credit_details/get',
                     CreditDetailsResponse,
                     build_payload(access_token,
                                   account_ids: account_ids)
    end
  end

  # Public: Response wrapper for /credit_details/get.
  class CreditDetailsResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The list of accounts: Array of Plaid::Models::Account.
    property :accounts, coerce: Array[Models::Account]

    ##
    # :attr_reader:
    # Public: The list of credit details: Array of
    # Plaid::Models::CreditDetails.
    property :credit_details, coerce: Array[Models::CreditDetails]

    ##
    # :attr_reader:
    # Public: The item: Plaid::Models::Item.
    property :item, coerce: Models::Item
  end
end
