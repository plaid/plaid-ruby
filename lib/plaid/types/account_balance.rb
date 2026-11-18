# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A set of fields describing the balance for an account. For real-time values, use `/accounts/balance/get` or
    # `/signal/evaluate` (with a Balance-only ruleset), which are fetched live from the institution at request time.
    # Values returned by other endpoints may be cached, or adjusted by Plaid to reflect transaction activity received
    # since the last refresh.
    class AccountBalance < Internal::Types::Model
      field :available, -> { Float }, optional: false, nullable: true

      field :current, -> { Float }, optional: false, nullable: true

      field :limit, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :last_updated_datetime, -> { String }, optional: true, nullable: true
    end
  end
end
