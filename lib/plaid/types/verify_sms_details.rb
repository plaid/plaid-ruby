# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional information for the `verify_sms` step.
    class VerifySmsDetails < Internal::Types::Model
      field :status, -> { Plaid::Types::VerifySmsDetailsStatus }, optional: false, nullable: false

      field :verifications, -> { Internal::Types::Array[Plaid::Types::SmsVerification] }, optional: false, nullable: false
    end
  end
end
