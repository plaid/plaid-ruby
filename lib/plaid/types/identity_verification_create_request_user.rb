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
    # If you are not using the shareable URL feature, you can optionally provide these fields via `/link/token/create`
    # instead; both `/identity_verification/create` and `/link/token/create` are valid ways to provide this information.
    # Note that if you provide a non-`null` user data object via `/identity_verification/create`, any user data fields
    # entered via `/link/token/create` for the same `client_user_id` will be ignored when prefilling Link.
    #
    # The `ip_address` field is optional. Provide the end user's IP address to enable IP-based risk checks for
    # backend-only integrations that do not use the Link SDK; when the Link SDK is used, the IP address is collected
    # automatically. Unlike the identity fields above, `ip_address` cannot be provided via `/link/token/create`.
    class IdentityVerificationCreateRequestUser < Internal::Types::Model
      field :email_address, -> { String }, optional: true, nullable: false

      field :phone_number, -> { String }, optional: true, nullable: true

      field :date_of_birth, -> { String }, optional: true, nullable: false

      field :name, -> { Plaid::Types::IdentityVerificationRequestUserName }, optional: true, nullable: true

      field :address, -> { Plaid::Types::UserAddress }, optional: true, nullable: true

      field :id_number, -> { Plaid::Types::UserIDNumber }, optional: true, nullable: true

      field :client_user_id, -> { String }, optional: true, nullable: true

      field :ip_address, -> { String }, optional: true, nullable: true
    end
  end
end
