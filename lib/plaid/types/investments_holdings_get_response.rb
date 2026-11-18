# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # InvestmentsHoldingsGetResponse defines the response schema for `/investments/holdings/get`
    class InvestmentsHoldingsGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::InvestmentAccount] }, optional: false, nullable: false

      field :holdings, -> { Internal::Types::Array[Plaid::Types::Holding] }, optional: false, nullable: false

      field :securities, -> { Internal::Types::Array[Plaid::Types::Security] }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :is_investments_fallback_item, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
