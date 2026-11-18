# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information related to the delivery of the link session to users
    class LinkDeliveryMetadata < Internal::Types::Model
      field :communication_method, -> { Plaid::Types::LinkDeliveryWebhookCommunicationMethod }, optional: true, nullable: false

      field :delivery_status, -> { Plaid::Types::LinkDeliveryWebhookDeliveryStatus }, optional: true, nullable: false
    end
  end
end
