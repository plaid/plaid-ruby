# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an Item is expected to be disconnected. The webhook will currently be fired 7 days before the existing
    # Item is scheduled for disconnection. This can be resolved by having the user go through Link's [update
    # mode](https://plaid.com/docs/link/update-mode). Currently, this webhook is fired only for US or Canadian
    # institutions; in the UK or EU, you should continue to listen for the
    # [`PENDING_EXPIRATION`](https://plaid.com/docs/api/items/#pending_expiration) webhook instead.
    class PendingDisconnectWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :reason, -> { Plaid::Types::PendingDisconnectWebhookReason }, optional: false, nullable: false

      field :disconnect_time, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
