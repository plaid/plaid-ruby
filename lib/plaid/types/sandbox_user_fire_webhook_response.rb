# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxUserFireWebhookResponse defines the response schema for `/sandbox/user/fire_webhook`
    class SandboxUserFireWebhookResponse < Internal::Types::Model
      field :webhook_fired, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
