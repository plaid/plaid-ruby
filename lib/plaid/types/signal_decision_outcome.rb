# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SignalDecisionOutcome
      extend Plaid::Internal::Types::Enum

      APPROVE = "APPROVE"
      REVIEW = "REVIEW"
      REJECT = "REJECT"
      TAKE_OTHER_RISK_MEASURES = "TAKE_OTHER_RISK_MEASURES"
      NOT_EVALUATED = "NOT_EVALUATED"
    end
  end
end
