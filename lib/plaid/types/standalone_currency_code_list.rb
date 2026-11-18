# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The following currency codes are supported by Plaid.
    class StandaloneCurrencyCodeList < Internal::Types::Model
      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :unofficial_currency_code, -> { String }, optional: false, nullable: false
    end
  end
end
