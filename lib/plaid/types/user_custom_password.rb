# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Custom test accounts are configured with a JSON configuration object formulated according to the schema below. All
    # top level fields are optional. Sending an empty object as a configuration will result in an account configured
    # with random balances and transaction history.
    class UserCustomPassword < Internal::Types::Model
      field :version, -> { Integer }, optional: true, nullable: true

      field :seed, -> { String }, optional: true, nullable: false

      field :roll_dates_forward, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :has_perpetual_otp, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :override_accounts, -> { Internal::Types::Array[Plaid::Types::OverrideAccounts] }, optional: true, nullable: false

      field :mfa, -> { Plaid::Types::Mfa }, optional: true, nullable: false

      field :recaptcha, -> { String }, optional: true, nullable: false

      field :force_error, -> { String }, optional: true, nullable: false
    end
  end
end
