# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Webhook indicating that the status of the delivery of the Hosted Link session to a user
    class LinkUserDeliveryStatusWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :link_delivery_session_id, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :link_delivery_metadata, -> { Plaid::Types::LinkDeliveryMetadata }, optional: false, nullable: false
    end
  end
end
