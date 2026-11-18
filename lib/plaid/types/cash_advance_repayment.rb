# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The repayment details for a cash-advance.
    class CashAdvanceRepayment < Internal::Types::Model
      field :amount_paid, -> { Plaid::Types::Amount }, optional: true, nullable: true

      field :amount_due, -> { Plaid::Types::Amount }, optional: false, nullable: false

      field :due_date, -> { String }, optional: false, nullable: false
    end
  end
end
