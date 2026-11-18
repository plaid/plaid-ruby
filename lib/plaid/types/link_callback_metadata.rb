# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information related to the callback from the Hosted Link session.
    class LinkCallbackMetadata < Internal::Types::Model
      field :callback_type, -> { Plaid::Types::LinkDeliveryWebhookCallbackType }, optional: true, nullable: false

      field :event_name, -> { Plaid::Types::LinkEventName }, optional: true, nullable: false

      field :status, -> { String }, optional: true, nullable: false

      field :link_session_id, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false

      field :institution, -> { Plaid::Types::LinkDeliveryInstitution }, optional: true, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::LinkDeliveryAccount] }, optional: true, nullable: false
    end
  end
end
