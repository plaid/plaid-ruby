# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the option security.
    #
    # For the Sandbox environment, this data is currently only available if the Item is using a [custom Sandbox
    # user](https://plaid.com/docs/sandbox/user-custom/) and the `ticker_symbol` field of the custom security follows
    # the [OCC Option Symbol](https://en.wikipedia.org/wiki/Option_symbol#The_OCC_Option_Symbol) standard with no
    # spaces. For an example of simulating this in Sandbox, see the [custom Sandbox
    # GitHub](https://github.com/plaid/sandbox-custom-users).
    class OptionContract < Internal::Types::Model
      field :contract_type, -> { String }, optional: false, nullable: false

      field :expiration_date, -> { String }, optional: false, nullable: false

      field :strike_price, -> { Float }, optional: false, nullable: false

      field :underlying_security_ticker, -> { String }, optional: false, nullable: false
    end
  end
end
