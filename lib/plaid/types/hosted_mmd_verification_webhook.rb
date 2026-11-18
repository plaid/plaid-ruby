# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains the state of an SMS Same-Day Micro-deposits verification session.
    class HostedMmdVerificationWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :status, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: true, nullable: false
    end
  end
end
