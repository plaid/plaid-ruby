# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The submitted address as the data provider standardized it. `null` when the provider returned a validation level
    # without a standardized address. The provider returns a single street line, so `street2` is always `null`.
    # `country` is always `US`.
    class BusinessStandardizedAddress < Internal::Types::Model
      field :street, -> { String }, optional: false, nullable: true

      field :street2, -> { String }, optional: false, nullable: true

      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: false

      field :lat, -> { Float }, optional: false, nullable: true

      field :lon, -> { Float }, optional: false, nullable: true
    end
  end
end
