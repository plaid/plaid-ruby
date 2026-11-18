# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The payer's bank account numbers. Exactly one of IBAN or Bacs data is required.
    class PaymentInitiationConsentPayerNumbers < Internal::Types::Model
      field :bacs, -> { Plaid::Types::PaymentInitiationOptionalRestrictionBacs }, optional: true, nullable: true

      field :iban, -> { String }, optional: true, nullable: true
    end
  end
end
