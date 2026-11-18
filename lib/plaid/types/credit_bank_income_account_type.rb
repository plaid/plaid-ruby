# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CreditBankIncomeAccountType
      extend Plaid::Internal::Types::Enum

      DEPOSITORY = "depository"
    end
  end
end
