# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an identity verification has been retried, which can be triggered via the dashboard or the API.
    class IdentityVerificationRetriedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :identity_verification_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
