# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A physical mailing address.
    class Address < Internal::Types::Model
      field :data, -> { Plaid::Types::AddressData }, optional: false, nullable: false

      field :primary, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
