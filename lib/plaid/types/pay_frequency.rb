# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The frequency of the pay period.
    class PayFrequency < Internal::Types::Model
      field :value, -> { Plaid::Types::PayFrequencyValue }, optional: false, nullable: false

      field :verification_status, -> { Plaid::Types::VerificationStatus }, optional: false, nullable: false
    end
  end
end
