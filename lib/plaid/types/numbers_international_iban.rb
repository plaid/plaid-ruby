# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Account numbers using the International Bank Account Number and BIC/SWIFT code format.
    class NumbersInternationalIban < Internal::Types::Model
      field :iban, -> { String }, optional: false, nullable: false

      field :bic, -> { String }, optional: false, nullable: false
    end
  end
end
