# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A physical mailing address.
    class AddressOverride < Internal::Types::Model
      field :data, -> { Plaid::Types::AddressDataOverride }, optional: false, nullable: false

      field :primary, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
