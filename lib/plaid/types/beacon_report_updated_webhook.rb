# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when one of your existing Beacon Reports has been modified or removed from the Beacon Network.
    class BeaconReportUpdatedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :beacon_report_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
