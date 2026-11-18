# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraLoanApplicationDecision
      extend Plaid::Internal::Types::Enum

      APPROVED = "APPROVED"
      DECLINED = "DECLINED"
      OTHER = "OTHER"
    end
  end
end
