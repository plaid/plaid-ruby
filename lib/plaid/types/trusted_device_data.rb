# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Trusted Device data associated with the previous Link session.
    class TrustedDeviceData < Internal::Types::Model
      field :trust_level, -> { Integer }, optional: true, nullable: false

      field :device_id, -> { Plaid::Types::DeviceID }, optional: true, nullable: false
    end
  end
end
