# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing both the current pay period and year to date amount for a category.
    class Total < Internal::Types::Model
      field :canonical_description, -> { Plaid::Types::TotalCanonicalDescription }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true

      field :current_pay, -> { Plaid::Types::Pay }, optional: true, nullable: false

      field :ytd_pay, -> { Plaid::Types::Pay }, optional: true, nullable: false
    end
  end
end
