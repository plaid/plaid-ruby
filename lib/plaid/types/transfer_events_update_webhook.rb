# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when new transfer events are available. Receiving this webhook indicates you should fetch the new events
    # from `/transfer/event/sync`. If multiple transfer events occur within a single minute, only one webhook will be
    # fired, so a single webhook instance may correspond to multiple transfer events.
    class TransferEventsUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
