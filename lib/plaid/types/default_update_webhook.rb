# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when new transaction data is available for an Item. Plaid will typically check for new transaction data
    # several times a day.
    #
    # This webhook is intended for use with `/transactions/get`; if you are using the newer `/transactions/sync`
    # endpoint, this webhook will still be fired to maintain backwards compatibility, but it is recommended to listen
    # for and respond to the `SYNC_UPDATES_AVAILABLE` webhook instead.
    class DefaultUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :new_transactions, -> { Float }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
