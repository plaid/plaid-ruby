# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an Item's initial transaction pull is completed. Once this webhook has been fired, transaction data for
    # the most recent 30 days can be fetched for the Item. This webhook will also be fired if account selections for the
    # Item are updated, with `new_transactions` set to the number of net new transactions pulled after the account
    # selection update.
    #
    # This webhook is intended for use with `/transactions/get`; if you are using the newer `/transactions/sync`
    # endpoint, this webhook will still be fired to maintain backwards compatibility, but it is recommended to listen
    # for and respond to the `SYNC_UPDATES_AVAILABLE` webhook instead.
    class InitialUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :error, -> { String }, optional: true, nullable: true

      field :new_transactions, -> { Float }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
