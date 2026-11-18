# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CashAdvanceFeedbackType
      extend Plaid::Internal::Types::Enum

      DECISION = "DECISION"
      REPAYMENT = "REPAYMENT"
    end
  end
end
