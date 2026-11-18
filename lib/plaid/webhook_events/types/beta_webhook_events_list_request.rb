# frozen_string_literal: true

module Plaid
  module WebhookEvents
    module Types
      class BetaWebhookEventsListRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false

        field :start_time, -> { String }, optional: true, nullable: true

        field :count, -> { Integer }, optional: true, nullable: true

        field :webhook_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :webhook_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :delivery_statuses, -> { Internal::Types::Array[Plaid::Types::WebhookEventDeliveryStatus] }, optional: true, nullable: false
      end
    end
  end
end
