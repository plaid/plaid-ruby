# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an Item's webhook is updated. This will be sent to the newly specified webhook.
    class WebhookUpdateAcknowledgedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :new_webhook_url, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
