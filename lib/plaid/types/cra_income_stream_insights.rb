# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled insights for a given income stream.
    class CraIncomeStreamInsights < Internal::Types::Model
      field :income_category, -> { Plaid::Types::CraIncomeCategory }, optional: false, nullable: false

      field :pay_frequency, -> { Plaid::Types::CreditBankIncomePayFrequency }, optional: false, nullable: false

      field :income_provider, -> { Plaid::Types::CraBankIncomeIncomeProvider }, optional: false, nullable: true

      field :status, -> { Plaid::Types::CraBankIncomeStatus }, optional: false, nullable: false

      field :next_payment, -> { Plaid::Types::CraIncomeNextPayment }, optional: false, nullable: true
    end
  end
end
