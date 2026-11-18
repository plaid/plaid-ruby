# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains loan data to update.
    class CraLoanUpdate < Internal::Types::Model
      field :loan_id, -> { String }, optional: true, nullable: false

      field :status_history, -> { Internal::Types::Array[Plaid::Types::CraLoanStatusHistoryUpdate] }, optional: true, nullable: false

      field :payment_history, -> { Internal::Types::Array[Plaid::Types::CraLoanPaymentHistory] }, optional: true, nullable: false
    end
  end
end
