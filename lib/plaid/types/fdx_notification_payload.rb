# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Custom key-value pairs payload for a notification
    class FdxNotificationPayload < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :id_type, -> { Plaid::Types::FdxNotificationPayloadIDType }, optional: true, nullable: false, api_name: "idType"

      field :event, -> { Plaid::Types::FdxLifecycleEvent }, optional: true, nullable: false
    end
  end
end
