# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when recurring transactions data is updated. This includes when a new recurring stream is detected or when a
    # new transaction is added to an existing recurring stream. The `RECURRING_TRANSACTIONS_UPDATE` webhook will also
    # fire when one or more attributes of the recurring stream changes, which is usually a result of the addition,
    # update, or removal of transactions to the stream.
    #
    # After receipt of this webhook, the updated data can be fetched from `/transactions/recurring/get`.
    class RecurringTransactionsUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :account_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
