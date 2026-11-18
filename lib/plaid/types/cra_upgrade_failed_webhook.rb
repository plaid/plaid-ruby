# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a Check Report upgrade attempt has failed
    class CraUpgradeFailedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :item_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
