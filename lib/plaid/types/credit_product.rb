# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A product included in a Consumer Report, along with the version that was generated.
    class CreditProduct < Internal::Types::Model
      field :product, -> { Plaid::Types::Products }, optional: false, nullable: false

      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
