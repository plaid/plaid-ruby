# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing fields describing property address.
    class MortgagePropertyAddress < Internal::Types::Model
      field :city, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :street, -> { String }, optional: false, nullable: true
    end
  end
end
