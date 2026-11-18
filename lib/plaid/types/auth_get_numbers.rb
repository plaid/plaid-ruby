# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing identifying numbers used for making electronic transfers to and from the `accounts`. The
    # identifying number type (ACH, EFT, IBAN, or Bacs) used will depend on the country of the account. An account may
    # have more than one number type. If a particular identifying number type is not used by any `accounts` for which
    # data has been requested, the array for that type will be empty.
    class AuthGetNumbers < Internal::Types::Model
      field :ach, -> { Internal::Types::Array[Plaid::Types::NumbersAch] }, optional: false, nullable: false

      field :eft, -> { Internal::Types::Array[Plaid::Types::NumbersEft] }, optional: false, nullable: false

      field :international, -> { Internal::Types::Array[Plaid::Types::NumbersInternational] }, optional: false, nullable: false

      field :bacs, -> { Internal::Types::Array[Plaid::Types::NumbersBacs] }, optional: false, nullable: false
    end
  end
end
