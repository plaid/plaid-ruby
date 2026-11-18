# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the pay period.
    class PayPeriodDetails < Internal::Types::Model
      field :check_amount, -> { Float }, optional: true, nullable: true

      field :distribution_breakdown, -> { Internal::Types::Array[Plaid::Types::DistributionBreakdown] }, optional: true, nullable: false

      field :end_date, -> { String }, optional: true, nullable: true

      field :gross_earnings, -> { Float }, optional: true, nullable: true

      field :pay_date, -> { String }, optional: true, nullable: true

      field :pay_frequency, -> { Plaid::Types::PayPeriodDetailsPayFrequency }, optional: true, nullable: true

      field :pay_day, -> { String }, optional: true, nullable: true

      field :start_date, -> { String }, optional: true, nullable: true
    end
  end
end
