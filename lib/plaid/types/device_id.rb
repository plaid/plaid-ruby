# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Device ID associated with the device used during the previous Link session
    class DeviceID < Internal::Types::Model
      field :type, -> { Integer }, optional: true, nullable: false

      field :id, -> { String }, optional: true, nullable: false
    end
  end
end
