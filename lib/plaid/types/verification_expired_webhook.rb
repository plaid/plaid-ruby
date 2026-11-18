# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an Item was not verified via automated micro-deposits after seven days since the automated
    # micro-deposit was made.
    class VerificationExpiredWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true
    end
  end
end
