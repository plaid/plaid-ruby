# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata specifically related to valid Payment Initiation standing order configurations for the institution.
    class PaymentInitiationStandingOrderMetadata < Internal::Types::Model
      field :supports_standing_order_end_date, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :supports_standing_order_negative_execution_days, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :valid_standing_order_intervals, -> { Internal::Types::Array[Plaid::Types::PaymentScheduleInterval] }, optional: false, nullable: true
    end
  end
end
