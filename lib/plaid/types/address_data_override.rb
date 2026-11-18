# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the components comprising an address.
    class AddressDataOverride < Internal::Types::Model
      field :city, -> { String }, optional: false, nullable: false

      field :region, -> { String }, optional: true, nullable: false

      field :street, -> { String }, optional: false, nullable: false

      field :postal_code, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
