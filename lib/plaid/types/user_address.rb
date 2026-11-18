# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Home address for the user. Supported values are: not provided, address with only country code or full address.
    #
    # For more context on this field, see [Input Validation by
    # Country](https://plaid.com/docs/identity-verification/hybrid-input-validation/#input-validation-by-country).
    class UserAddress < Internal::Types::Model
      field :street, -> { String }, optional: true, nullable: true

      field :street2, -> { String }, optional: true, nullable: true

      field :city, -> { String }, optional: true, nullable: true

      field :region, -> { String }, optional: true, nullable: true

      field :postal_code, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
