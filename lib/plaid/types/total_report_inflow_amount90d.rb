# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Total amount of money into the report's accounts in the last 90 days. This field only takes into account USD
    # transactions from the accounts.
    class TotalReportInflowAmount90D < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
