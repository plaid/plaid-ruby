# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BetaWebhookEventsListResponse defines the response schema for `/beta/webhook_events/list`
    class BetaWebhookEventsListResponse < Internal::Types::Model
      field :webhook_events, -> { Internal::Types::Array[Plaid::Types::WebhookEvent] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
