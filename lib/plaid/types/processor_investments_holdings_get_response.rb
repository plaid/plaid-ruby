# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorInvestmentsHoldingsGetResponse defines the response schema for `/processor/investments/holdings/get`
    class ProcessorInvestmentsHoldingsGetResponse < Internal::Types::Model
      field :account, -> { Plaid::Types::InvestmentAccount }, optional: false, nullable: false

      field :holdings, -> { Internal::Types::Array[Plaid::Types::Holding] }, optional: false, nullable: false

      field :securities, -> { Internal::Types::Array[Plaid::Types::Security] }, optional: false, nullable: false

      field :is_investments_fallback_item, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
