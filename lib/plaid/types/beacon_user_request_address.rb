# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Home address for the associated user. For more context on this field, see [Input Validation by
    # Country](https://plaid.com/docs/identity-verification/hybrid-input-validation/#input-validation-by-country).
    class BeaconUserRequestAddress < Internal::Types::Model
      field :street, -> { String }, optional: false, nullable: false

      field :street2, -> { String }, optional: true, nullable: true

      field :city, -> { String }, optional: false, nullable: false

      field :region, -> { String }, optional: true, nullable: true

      field :postal_code, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
