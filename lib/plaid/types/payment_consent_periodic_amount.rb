# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines consent payments limitations per period.
    class PaymentConsentPeriodicAmount < Internal::Types::Model
      field :amount, -> { Plaid::Types::PaymentAmount }, optional: false, nullable: false

      field :interval, -> { Plaid::Types::PaymentConsentPeriodicInterval }, optional: false, nullable: false

      field :alignment, -> { Plaid::Types::PaymentConsentPeriodicAlignment }, optional: false, nullable: false
    end
  end
end
