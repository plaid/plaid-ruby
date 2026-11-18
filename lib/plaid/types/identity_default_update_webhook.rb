# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a change to identity data has been detected on an Item. Items are checked for identity updates every
    # 30-90 days. We recommend that upon receiving this webhook you make another call to `/identity/get` to fetch the
    # user's latest identity data.
    class IdentityDefaultUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :account_ids_with_updated_identity, -> { Internal::Types::Hash[String, Internal::Types::Array[Plaid::Types::IdentityUpdateTypes]] }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
