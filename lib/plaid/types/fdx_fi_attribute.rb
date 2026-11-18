# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Financial Institution provider-specific attribute
    class FdxFiAttribute < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
