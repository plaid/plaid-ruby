# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorInvestmentsTransactionsGetResponse defines the response schema for
    # `/processor/investments/transactions/get`
    class ProcessorInvestmentsTransactionsGetResponse < Internal::Types::Model
      field :account, -> { Plaid::Types::InvestmentAccount }, optional: false, nullable: false

      field :investment_transactions, -> { Internal::Types::Array[Plaid::Types::InvestmentTransaction] }, optional: false, nullable: false

      field :securities, -> { Internal::Types::Array[Plaid::Types::Security] }, optional: false, nullable: false

      field :total_investment_transactions, -> { Integer }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :is_investments_fallback_item, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
