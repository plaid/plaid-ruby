# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Initiator Fi Attribute
    class FdxInitiatorFiAttribute < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :value, -> { String }, optional: true, nullable: false
    end
  end
end
