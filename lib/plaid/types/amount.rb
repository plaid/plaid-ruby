# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A monetary amount and its currency.
    class Amount < Internal::Types::Model
      field :iso_currency_code, -> { String }, optional: true, nullable: false

      field :value, -> { Float }, optional: false, nullable: false
    end
  end
end
