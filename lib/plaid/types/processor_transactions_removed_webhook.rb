# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This webhook is only sent to [Plaid processor partners](https://plaid.com/docs/auth/partnerships/).
    #
    # Fired when transaction(s) for an Item are deleted. The deleted transaction IDs are included in the webhook
    # payload. Plaid will typically check for deleted transaction data several times a day.
    #
    # This webhook is intended for use with `/processor/transactions/get`; if you are using the newer
    # `/processor/transactions/sync` endpoint, this webhook will still be fired to maintain backwards compatibility, but
    # it is recommended to listen for and respond to the `SYNC_UPDATES_AVAILABLE` webhook instead.
    class ProcessorTransactionsRemovedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :removed_transactions, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
