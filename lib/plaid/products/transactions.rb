require 'date'

module Plaid
  # Public: Class used to call the Transactions product.
  class Transactions < BaseProduct
    # Public: Get information about transactions
    #
    # Does a POST /transactions/get call which gives you high level account
    # data along with transactions from all accounts contained in the
    # access_token's item.
    #
    # access_token - access_token who's item to fetch transactions for.
    # start_date   - Start of query for transactions.
    # end_date     - End of query for transactions.
    # account_ids  - Specific account ids to fetch balances for (optional).
    # count        - Amount of transactions to pull (optional).
    # offset       - Offset to start pulling transactions (optional).
    # options      - Additional options to merge into API request.
    #
    # Returns GetResponse.
    def get(access_token, start_date, end_date,
            account_ids: nil, count: nil, offset: nil, options: nil)

      options_payload = {}
      options_payload[:account_ids] = account_ids unless account_ids.nil?
      options_payload[:count] = count unless count.nil?
      options_payload[:offset] = offset unless offset.nil?
      options_payload.merge!(options) unless options.nil?

      post_with_auth 'transactions/get',
                     GetResponse,
                     access_token: access_token,
                     start_date: Plaid.convert_to_date_string(start_date),
                     end_date: Plaid.convert_to_date_string(end_date),
                     options: options_payload
    end

    # Public: Response for /transactions/get.
    class GetResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The item: Plaid::Models::Item.
      property :item, coerce: Models::Item

      ##
      # :attr_reader:
      # Public: The list of accounts: Array of Plaid::Models::Account.
      property :accounts, coerce: Array[Models::Account]

      ##
      # :attr_reader:
      # Public: The list of transactions: Array of Plaid::Models::Transaction.
      property :transactions, coerce: Array[Models::Transaction]

      ##
      # :attr_reader:
      # Public: The String last updated time (if available).
      property :last_updated

      ##
      # :attr_reader:
      # Public: The Numeric total transactions count.
      property :total_transactions
    end
  end
end
