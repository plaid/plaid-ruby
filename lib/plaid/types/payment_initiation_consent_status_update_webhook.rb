# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the status of a payment consent has changed.
    class PaymentInitiationConsentStatusUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :consent_id, -> { String }, optional: false, nullable: false

      field :old_status, -> { Plaid::Types::PaymentInitiationConsentStatus }, optional: false, nullable: false

      field :new_status, -> { Plaid::Types::PaymentInitiationConsentStatus }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
