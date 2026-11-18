# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the components comprising an address.
    class AddressDataNullable < Internal::Types::Model
      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :street, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: true
    end
  end
end
