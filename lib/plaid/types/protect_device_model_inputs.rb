# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Inputs for device Trust Index models.
    class ProtectDeviceModelInputs < Internal::Types::Model
      field :device_session_id, -> { String }, optional: false, nullable: false
    end
  end
end
