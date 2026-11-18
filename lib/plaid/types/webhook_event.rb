# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A webhook event for your account.
    class WebhookEvent < Internal::Types::Model
      field :webhook_message_id, -> { String }, optional: false, nullable: false

      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: true

      field :sent_time, -> { String }, optional: false, nullable: false

      field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

      field :destination_url, -> { String }, optional: false, nullable: false

      field :delivery_status, -> { Plaid::Types::WebhookEventDeliveryStatus }, optional: false, nullable: false

      field :last_http_status_code, -> { Integer }, optional: false, nullable: true

      field :attempt_count, -> { Integer }, optional: false, nullable: false

      field :last_attempt_time, -> { String }, optional: false, nullable: true
    end
  end
end
