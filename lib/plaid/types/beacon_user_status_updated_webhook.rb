# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a Beacon User status has changed, which can occur manually via the dashboard or when information is
    # reported to the Beacon network.
    class BeaconUserStatusUpdatedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :beacon_user_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
