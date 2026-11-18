# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fires when an account has an expired verification when using micro-deposits
    class FallbackAuthMicrodepositVerificationExpiredWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :error, -> { String }, optional: true, nullable: true

      field :account_id, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
