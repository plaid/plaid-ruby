# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The full name for a given Beacon User.
    class BeaconUserName < Internal::Types::Model
      field :given_name, -> { String }, optional: false, nullable: false

      field :family_name, -> { String }, optional: false, nullable: false
    end
  end
end
