# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an error is encountered with an Item. The error can be resolved by having the user go through Link's
    # update mode.
    class ItemErrorWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
