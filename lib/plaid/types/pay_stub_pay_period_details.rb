# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the pay period.
    class PayStubPayPeriodDetails < Internal::Types::Model
      field :pay_amount, -> { Float }, optional: false, nullable: true

      field :distribution_breakdown, -> { Internal::Types::Array[Plaid::Types::PayStubDistributionBreakdown] }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: true

      field :gross_earnings, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :pay_date, -> { String }, optional: false, nullable: true

      field :pay_frequency, -> { String }, optional: false, nullable: true

      field :pay_basis, -> { Plaid::Types::CreditPayStubPayBasisType }, optional: true, nullable: false

      field :start_date, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
