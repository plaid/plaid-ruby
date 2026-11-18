# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Modeled insights for a given income stream.
    class CraVerificationIncomeStreamInsights < Internal::Types::Model
      field :income_category, -> { Plaid::Types::CraVerificationIncomeCategory }, optional: false, nullable: false

      field :pay_frequency, -> { Plaid::Types::CraVerificationIncomePayFrequency }, optional: false, nullable: false

      field :income_provider, -> { Plaid::Types::CraVerificationIncomeProvider }, optional: false, nullable: true

      field :status, -> { Plaid::Types::CraVerificationIncomeStatus }, optional: false, nullable: false

      field :next_payment, -> { Plaid::Types::CraVerificationIncomeNextPayment }, optional: false, nullable: true
    end
  end
end
