# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an end user has completed a step of the Identity Verification process.
    class IdentityVerificationStepUpdatedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :identity_verification_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
