# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AccountType
      extend Plaid::Internal::Types::Enum

      INVESTMENT = "investment"
      CREDIT = "credit"
      DEPOSITORY = "depository"
      LOAN = "loan"
      BROKERAGE = "brokerage"
      PAYROLL = "payroll"
      OTHER = "other"
    end
  end
end
