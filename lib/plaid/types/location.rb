# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of where a transaction took place. Location data is provided only for transactions at physical
    # locations, not for online transactions. Location data availability depends primarily on the merchant and is most
    # likely to be populated for transactions at large retail chains; small, local businesses are less likely to have
    # location data available.
    class Location < Internal::Types::Model
      field :address, -> { String }, optional: false, nullable: true

      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: true

      field :lat, -> { Float }, optional: false, nullable: true

      field :lon, -> { Float }, optional: false, nullable: true

      field :store_number, -> { String }, optional: false, nullable: true
    end
  end
end
