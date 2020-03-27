module Plaid
  # Public: Class used to call the Liabilities product.
  class Liabilities < BaseProduct
    # Public: Get liabilities information.
    #
    # Does a POST /liabilities/get call which fetches liabilities associated
    # with an access_token's item.
    #
    # access_token - access_token of an item to fetch liabilities for.
    # account_ids  - Specific account ids to fetch liabilities for
    #                (optional).
    #
    # Returns the LiabilitiesResponse object with liabilities data.
    def get(access_token, account_ids: nil)
      post_with_auth 'liabilities/get',
                     LiabilitiesResponse,
                     build_payload(access_token,
                                   account_ids: account_ids)
    end
  end

  # Public: Response wrapper for /liabilities/get.
  class LiabilitiesResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The list of accounts: Array of Plaid::Models::Account.
    property :accounts, coerce: Array[Models::Account]

    ##
    # :attr_reader:
    # Public: The liabilities: Plaid::Models::Liabilities.
    property :liabilities, coerce: Models::Liabilities

    ##
    # :attr_reader:
    # Public: The item: Plaid::Models::Item.
    property :item, coerce: Models::Item
  end
end
