# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when new bank transfer events are available. Receiving this webhook indicates you should fetch the new
    # events from `/bank_transfer/event/sync`.
    class BankTransfersEventsUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
