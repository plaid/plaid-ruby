# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the components comprising an address.
    class SignalAddressData < Internal::Types::Model
      field :city, -> { String }, optional: true, nullable: false

      field :region, -> { String }, optional: true, nullable: true

      field :street, -> { String }, optional: true, nullable: false

      field :postal_code, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: true, nullable: true
    end
  end
end
