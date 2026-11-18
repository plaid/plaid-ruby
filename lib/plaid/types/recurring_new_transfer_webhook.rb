# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a new transfer of a recurring transfer is originated.
    class RecurringNewTransferWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :recurring_transfer_id, -> { String }, optional: false, nullable: false

      field :transfer_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
