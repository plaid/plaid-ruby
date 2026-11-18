# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when new or updated holdings have been detected on an investment account. The webhook typically fires in
    # response to any newly added holdings or price changes to existing holdings, most commonly after market close.
    class HoldingsDefaultUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :new_holdings, -> { Float }, optional: false, nullable: false

      field :updated_holdings, -> { Float }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
