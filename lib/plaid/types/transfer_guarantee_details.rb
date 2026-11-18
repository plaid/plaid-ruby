# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Adaptive guarantee details for a transfer, including the guaranteed amount and settlement schedule. Omitted when
    # no guarantee was attempted.
    class TransferGuaranteeDetails < Internal::Types::Model
      field :guaranteed_amount, -> { String }, optional: false, nullable: false

      field :schedule, -> { Internal::Types::Array[Plaid::Types::TransferGuaranteeScheduleItem] }, optional: false, nullable: false
    end
  end
end
