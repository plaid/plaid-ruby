# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A phone number
    class PhoneNumber < Internal::Types::Model
      field :data, -> { String }, optional: false, nullable: false

      field :primary, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :type, -> { Plaid::Types::PhoneNumberType }, optional: false, nullable: false
    end
  end
end
