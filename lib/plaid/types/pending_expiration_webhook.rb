# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an Item's access consent is expiring in 7 days. This can be resolved by having the user go through
    # Link's update mode. This webhook is fired only for Items associated with institutions in Europe (including the
    # UK); for Items associated with institutions in the US or Canada, see
    # [`PENDING_DISCONNECT`](https://plaid.com/docs/api/items/#pending_disconnect) instead.
    class PendingExpirationWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :consent_expiration_time, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
