# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights around a user's counterparties
    class CounterpartyInsights < Internal::Types::Model
      field :financial_institution_insights, -> { Internal::Types::Array[Plaid::Types::FinancialInstitutionInsights] }, optional: true, nullable: false

      field :merchant_insights, -> { Internal::Types::Array[Plaid::Types::MerchantInsights] }, optional: true, nullable: false
    end
  end
end
