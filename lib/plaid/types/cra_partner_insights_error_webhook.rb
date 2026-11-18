# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a partner insights report has failed to generate
    class CraPartnerInsightsErrorWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
