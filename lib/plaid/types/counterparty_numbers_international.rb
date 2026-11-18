# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Account numbers using the International Bank Account Number and BIC/SWIFT code format.
    class CounterpartyNumbersInternational < Internal::Types::Model
      field :iban, -> { String }, optional: true, nullable: true

      field :bic, -> { String }, optional: true, nullable: true
    end
  end
end
