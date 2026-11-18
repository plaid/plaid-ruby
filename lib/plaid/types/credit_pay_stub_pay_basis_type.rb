# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CreditPayStubPayBasisType
      extend Plaid::Internal::Types::Enum

      SALARY = "SALARY"
      HOURLY = "HOURLY"
      COMMISSION = "COMMISSION"
    end
  end
end
