require 'date'

module Plaid
  # Public: Class used to get InvestmentTransactions for the Investments
  # product.
  class InvestmentTransactions < BaseProduct
    # Public: Get information about all available investment transactions.
    #
    # Does a POST /investments/transactions/get call which gives you high level
    # account data along with investment transactions and associated securities
    # from all investment accounts contained in the access_token's item.
    #
    # access_token - access_token who's item to get investment transactions for.
    # start_date   - Start of query for investment transactions.
    # end_date     - End of query for investment transactions.
    # account_ids  - Specific account ids to fetch transactions for (optional).
    # count        - Amount of investment transactions to pull (optional).
    # offset       - Offset to start pulling investment transactions (optional).
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

      post_with_auth 'investments/transactions/get',
                     GetResponse,
                     access_token: access_token,
                     start_date: Plaid.convert_to_date_string(start_date),
                     end_date: Plaid.convert_to_date_string(end_date),
                     options: options_payload
    end

    # Public: Response for /investments/transactions/get.
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
      # Public: The list of investment transactions: Array of
      # Plaid::Models::InvestmentTransaction.
      property :investment_transactions,
               coerce: Array[Models::InvestmentTransaction]

      ##
      # :attr_reader:
      # Public: The list of securities referenced by the investment
      # transactions: Array of Plaid::Models::Security.
      property :securities, coerce: Array[Models::Security]

      ##
      # :attr_reader:
      # Public: The Numeric total investment transactions count.
      property :total_investment_transactions
    end
  end

  # Public: Class used to get Holdings for the Investments product.
  class Holdings < BaseProduct
    # Public: Get information about all available investment holdings.
    #
    # Does a POST /investments/holdings/get call which gives you high level
    # account data along with investment holdings and associated securities
    # from all investment accounts contained in the access_token's item.
    #
    # access_token - access_token who's item to fetch holdings for.
    # account_ids  - Specific account ids to fetch holdings for (optional).
    # options      - Additional options to merge into API request.
    #
    # Returns GetResponse.
    def get(access_token, account_ids: nil, options: nil)
      post_with_auth 'investments/holdings/get',
                     GetResponse,
                     build_payload(access_token,
                                   account_ids: account_ids,
                                   options: options)
    end

    # Public: Response for /investments/holdings/get.
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
      # Public: The list of holdings: Array of Plaid::Models::Holding.
      property :holdings, coerce: Array[Models::Holding]

      ##
      # :attr_reader:
      # Public: The list of securities referenced by the holdings: Array of
      # Plaid::Models::Security.
      property :securities, coerce: Array[Models::Security]
    end
  end

  # Public: Class used to call the Accounts product.
  class Investments < BaseProduct
    ##
    # Public: The Plaid::InvestmentTransactions product accessor.
    subproduct :transactions, Plaid::InvestmentTransactions

    ##
    # Public: The Plaid::Holdings product accessor.
    subproduct :holdings
  end
end
