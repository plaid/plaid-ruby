# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferGuaranteeOutcome
      extend Plaid::Internal::Types::Enum

      FULL_INSTANT = "FULL_INSTANT"
      PARTIAL_INSTANT_ONLY = "PARTIAL_INSTANT_ONLY"
      PARTIAL_INSTANT_WITH_OBSERVATION_WINDOW = "PARTIAL_INSTANT_WITH_OBSERVATION_WINDOW"
      NOT_GUARANTEED = "NOT_GUARANTEED"
    end
  end
end
