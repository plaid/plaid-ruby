# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CashAdvanceRepaymentStatus
      extend Plaid::Internal::Types::Enum

      REPAID = "REPAID"
      PARTIAL_PAYMENT = "PARTIAL_PAYMENT"
      UNPAID = "UNPAID"
    end
  end
end
