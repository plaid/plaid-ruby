# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an entity screening status has changed, which can occur manually via the dashboard or during ongoing
    # monitoring.
    class EntityScreeningStatusUpdatedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :entity_screening_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
