# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a user successfully adds a Plaid Item during a Link session when using Hosted Link or Multi-Item Link
    # sessions. Contains the public token for the Item.
    class ItemAddResultWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :link_session_id, -> { String }, optional: false, nullable: false

      field :link_token, -> { String }, optional: false, nullable: false

      field :public_token, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
