# frozen_string_literal: true

module Plaid
  module Protect
    module Types
      class ProtectEventSendRequest < Internal::Types::Model
        field :timestamp, -> { String }, optional: true, nullable: false

        field :event, -> { Plaid::Types::ProtectEvent }, optional: false, nullable: true

        field :device_session_id, -> { String }, optional: true, nullable: false

        field :request_trust_index, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
