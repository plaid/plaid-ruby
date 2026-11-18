# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing details that can be found on the paystub.
    class PaystubDetails < Internal::Types::Model
      field :pay_period_start_date, -> { String }, optional: true, nullable: true

      field :pay_period_end_date, -> { String }, optional: true, nullable: true

      field :pay_date, -> { String }, optional: true, nullable: true

      field :paystub_provider, -> { String }, optional: true, nullable: true

      field :pay_frequency, -> { Plaid::Types::PaystubPayFrequency }, optional: true, nullable: true
    end
  end
end
