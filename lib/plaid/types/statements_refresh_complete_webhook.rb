# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when refreshed statements extraction is completed or failed to be completed. Triggered by calling
    # `/statements/refresh`.
    class StatementsRefreshCompleteWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :result, -> { Plaid::Types::StatementsRefreshCompleteResult }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
