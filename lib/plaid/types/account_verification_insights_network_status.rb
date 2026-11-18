# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Status information about the account and routing number in the Plaid network.
    class AccountVerificationInsightsNetworkStatus < Internal::Types::Model
      field :has_numbers_match, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :is_numbers_match_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
