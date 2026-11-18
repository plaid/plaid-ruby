# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Total amount of money into the account in the time period of the report. For non-depository accounts, or accounts
    # with no transactions, `amount` is `0` and both currency codes are `null`. This field only takes into account USD
    # transactions from the account.
    class TotalInflowAmount < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
