# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxItemFireWebhookResponse defines the response schema for `/sandbox/item/fire_webhook`
    class SandboxItemFireWebhookResponse < Internal::Types::Model
      field :webhook_fired, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
