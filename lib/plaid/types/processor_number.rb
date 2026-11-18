# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing identifying numbers used for making electronic transfers to and from the `account`. The
    # identifying number type (ACH, EFT, IBAN, or Bacs) used will depend on the country of the account. An account may
    # have more than one number type. If a particular identifying number type is not used by the `account` for which
    # auth data has been requested, a null value will be returned.
    class ProcessorNumber < Internal::Types::Model
      field :ach, -> { Plaid::Types::NumbersAchNullable }, optional: false, nullable: true

      field :eft, -> { Plaid::Types::NumbersEftNullable }, optional: false, nullable: true

      field :international, -> { Plaid::Types::NumbersInternationalNullable }, optional: false, nullable: true

      field :bacs, -> { Plaid::Types::NumbersBacsNullable }, optional: false, nullable: true
    end
  end
end
