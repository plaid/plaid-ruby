# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The ID number associated with a Beacon User.
    class BeaconUserIDNumber < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::IDNumberType }, optional: false, nullable: false
    end
  end
end
