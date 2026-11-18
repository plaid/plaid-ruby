# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a Beacon User created within your organization matches one of your existing users.
    class BeaconDuplicateDetectedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :beacon_duplicate_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
