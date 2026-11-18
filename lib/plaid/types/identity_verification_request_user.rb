# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # User information collected outside of Link, most likely via your own onboarding process.
    #
    # Each of the following identity fields are optional:
    #
    # `email_address`
    #
    # `phone_number`
    #
    # `date_of_birth`
    #
    # `name`
    #
    # `address`
    #
    # `id_number`
    #
    # Specifically, these fields are optional in that they can either be fully provided (satisfying every required field
    # in their subschema) or omitted from the request entirely by not providing the key or value.
    # Providing these fields via the API will result in Link skipping the data collection process for the associated
    # user. All verification steps enabled in the associated Identity Verification Template will still be run.
    # Verification steps will either be run immediately, or once the user completes the `accept_tos` step, depending on
    # the value provided to the `gave_consent` field.
    class IdentityVerificationRequestUser < Internal::Types::Model
      field :email_address, -> { String }, optional: true, nullable: false

      field :phone_number, -> { String }, optional: true, nullable: true

      field :date_of_birth, -> { String }, optional: true, nullable: false

      field :name, -> { Plaid::Types::IdentityVerificationRequestUserName }, optional: true, nullable: true

      field :address, -> { Plaid::Types::UserAddress }, optional: true, nullable: true

      field :id_number, -> { Plaid::Types::UserIDNumber }, optional: true, nullable: true
    end
  end
end
