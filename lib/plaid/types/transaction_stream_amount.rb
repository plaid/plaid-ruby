# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object with data pertaining to an amount on the transaction stream.
    class TransactionStreamAmount < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: false

      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :unofficial_currency_code, -> { String }, optional: true, nullable: true
    end
  end
end
