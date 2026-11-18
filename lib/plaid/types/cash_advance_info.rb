# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a cash-advance associated with the decision. Required when `is_taken` is `true`.
    class CashAdvanceInfo < Internal::Types::Model
      field :amount_approved, -> { Plaid::Types::Amount }, optional: false, nullable: false

      field :amount_due, -> { Plaid::Types::Amount }, optional: true, nullable: false

      field :due_date, -> { String }, optional: true, nullable: false
    end
  end
end
