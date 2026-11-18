# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains the payment information for a loan payment period.
    class CraLoanPaymentHistory < Internal::Types::Model
      field :period, -> { Integer }, optional: false, nullable: false

      field :due_date, -> { String }, optional: false, nullable: false

      field :days_past_due, -> { Integer }, optional: false, nullable: false

      field :amount_past_due, -> { Float }, optional: true, nullable: false

      field :balance_remaining, -> { Float }, optional: true, nullable: false
    end
  end
end
