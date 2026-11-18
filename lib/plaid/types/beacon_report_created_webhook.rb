# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when one of your Beacon Users is first reported to the Beacon network.
    class BeaconReportCreatedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :beacon_report_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
