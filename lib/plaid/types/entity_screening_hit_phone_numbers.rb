# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Phone number information associated with the entity screening hit
    class EntityScreeningHitPhoneNumbers < Internal::Types::Model
      field :type, -> { Plaid::Types::PhoneType }, optional: false, nullable: false

      field :phone_number, -> { String }, optional: false, nullable: false
    end
  end
end
