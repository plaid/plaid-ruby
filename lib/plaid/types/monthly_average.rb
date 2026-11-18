# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The monthly average amount calculated by dividing the total by the number of calendar months in the time period.
    class MonthlyAverage < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true
    end
  end
end
