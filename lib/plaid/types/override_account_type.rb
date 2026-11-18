# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module OverrideAccountType
      extend Plaid::Internal::Types::Enum

      INVESTMENT = "investment"
      CREDIT = "credit"
      DEPOSITORY = "depository"
      LOAN = "loan"
      PAYROLL = "payroll"
      OTHER = "other"
    end
  end
end
