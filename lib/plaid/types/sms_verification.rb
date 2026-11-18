# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional information for the individual SMS verification.
    class SmsVerification < Internal::Types::Model
      field :status, -> { Plaid::Types::SmsVerificationStatus }, optional: false, nullable: false

      field :attempt, -> { Integer }, optional: false, nullable: false

      field :phone_number, -> { String }, optional: false, nullable: true

      field :delivery_attempt_count, -> { Integer }, optional: false, nullable: false

      field :solve_attempt_count, -> { Integer }, optional: false, nullable: false

      field :initially_sent_at, -> { String }, optional: false, nullable: true

      field :last_sent_at, -> { String }, optional: false, nullable: true

      field :redacted_at, -> { String }, optional: false, nullable: true
    end
  end
end
