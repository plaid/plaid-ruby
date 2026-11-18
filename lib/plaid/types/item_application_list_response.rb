# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes the connected application for a particular end user.
    class ItemApplicationListResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: true, nullable: false

      field :applications, -> { Internal::Types::Array[Plaid::Types::ConnectedApplication] }, optional: false, nullable: false

      field :disconnected_applications, -> { Internal::Types::Array[Plaid::Types::DisconnectedApplication] }, optional: true, nullable: false
    end
  end
end
