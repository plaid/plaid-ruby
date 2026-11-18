# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module EmploymentSourceType
      extend Plaid::Internal::Types::Enum

      BANK = "bank"
      PAYROLL = "payroll"
    end
  end
end
