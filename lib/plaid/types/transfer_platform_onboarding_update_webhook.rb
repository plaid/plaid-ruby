# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the status of an onboarding originator has been updated. Call `/transfer/originator/get` to check the
    # latest status
    class TransferPlatformOnboardingUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :originator_client_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
