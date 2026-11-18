# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Even if an address has been collected, some fields may be null depending on the region's addressing system. For
    # example:
    #
    # Addresses from the United Kingdom will not include a region
    #
    # Addresses from Hong Kong will not include postal code
    class IdentityVerificationUserAddress < Internal::Types::Model
      field :street, -> { String }, optional: false, nullable: true

      field :street2, -> { String }, optional: false, nullable: true

      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
