# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when new ACH events are available. To begin receiving this webhook, you must first register your webhook
    # listener endpoint via the [webhooks page in the Dashboard](https://dashboard.plaid.com/team/webhooks). The
    # `BANK_TRANSFERS_EVENTS_UPDATE` webhook can be used to track the progress of ACH transfers used in [micro-deposit
    # verification](https://plaid.com/docs/auth/coverage/microdeposit-events/). Receiving this webhook indicates you
    # should fetch the new events from `/bank_transfer/event/sync`. Note that
    # [Transfer](https://plaid.com/docs/transfer) customers should use Transfer webhooks instead of using
    # `BANK_TRANSFERS_EVENTS_UPDATE`; see [micro-deposit events
    # documentation](https://plaid.com/docs/auth/coverage/microdeposit-events/) for more details.
    class BankTransfersEventsUpdateWebhookForAuth < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
