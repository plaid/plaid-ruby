require 'date'

module Plaid
  # Internal: Converts date objects to strings if needed
  #
  # Takes in a string or a Date object and performs necessary operations to return a
  # string representation of the Date
  #
  # date - Date in Date object form or string form (YYYY-MM-DD)
  #
  # Returns a string representing a date needed for transaction start and end dates
  def self.convert_to_date_string(date)
    case date
    when String
      date
    else
      date.to_date.strftime('%Y-%m-%d')
    end
  end

  # Public: Class used to call the Transactions product.
  class Transactions
    def initialize(client)
      @client = client
    end

    # Public: Get information about transactions
    #
    # Does a POST /transactions/get call which gives you high level account data along
    # with transactions from all accounts contained in the access_token's item
    #
    # access_token - access_token who's item to fetch transactions for
    # start_date   - Start of query for transactions
    # end_date     - End of query for transactions
    # account_ids  - Specific account ids to fetch balances for (optional)
    # count        - Amount of transactions to pull (optional)
    # offset       - Offset to start pulling transactions (optional)
    # options      - Additional options to merge into API request
    #
    # Returns a parsed JSON listing information on transactions
    def get(access_token,
            start_date,
            end_date,
            account_ids: nil,
            count: nil,
            offset: nil,
            options: nil)
      options_payload = {}
      options_payload[:account_ids] = account_ids unless account_ids.nil?
      options_payload[:count] = count unless count.nil?
      options_payload[:offset] = offset unless offset.nil?
      options_payload = options_payload.merge(options) unless options.nil?

      payload = { access_token: access_token,
                  start_date: Plaid.convert_to_date_string(start_date),
                  end_date: Plaid.convert_to_date_string(end_date),
                  options: options_payload }
      @client.post_with_auth('transactions/get', payload)
    end

    # Public: Deactivate transactions for given access_token.
    #
    # Does a POST /transactions/deactivate call which deactivates the transaction product
    # for a given access_token
    #
    # access_token - access_token to deactivate transactions for
    #
    # Returns a parsed JSON containing a message describing deactivation success.
    def deactivate(access_token)
      payload = { access_token: access_token }
      @client.post_with_auth('transactions/deactivate', payload)
    end
  end
end
