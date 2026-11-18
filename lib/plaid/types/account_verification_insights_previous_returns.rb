# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about known ACH returns for the account and routing number.
    class AccountVerificationInsightsPreviousReturns < Internal::Types::Model
      field :has_previous_administrative_return, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
