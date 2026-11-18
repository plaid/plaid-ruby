# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a balance held by an account in the past
    class CashflowReportHistoricalBalance < Internal::Types::Model
      field :date, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
