# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An address the data provider listed on a registration, for the registration itself or for its registered agent.
    # `null` when the provider listed none. The provider returns a single street line, so `street2` is always `null`.
    # `country` is always `US`.
    class BusinessRegistrationAddressNullable < Internal::Types::Model
      field :street, -> { String }, optional: false, nullable: true

      field :street2, -> { String }, optional: false, nullable: true

      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: false

      field :lat, -> { Float }, optional: false, nullable: true

      field :lon, -> { Float }, optional: false, nullable: true

      field :deliverability, -> { Plaid::Types::BusinessAddressDeliverability }, optional: false, nullable: false
    end
  end
end
