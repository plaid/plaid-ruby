# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Adaptive guarantee details for a transfer authorization, including the guarantee outcome and settlement schedule.
    # Omitted when no guarantee was attempted.
    class AuthorizationGuaranteeDetails < Internal::Types::Model
      field :outcome, -> { Plaid::Types::TransferGuaranteeOutcome }, optional: false, nullable: false

      field :schedule, -> { Internal::Types::Array[Plaid::Types::AuthorizationGuaranteeScheduleItem] }, optional: false, nullable: false
    end
  end
end
