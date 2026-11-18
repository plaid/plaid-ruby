# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Total amount of money out of the report's accounts in the last 60 days. This field only takes into account USD
    # transactions from the accounts.
    class TotalReportOutflowAmount60D < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
