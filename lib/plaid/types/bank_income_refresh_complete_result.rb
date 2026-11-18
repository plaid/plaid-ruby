# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BankIncomeRefreshCompleteResult
      extend Plaid::Internal::Types::Enum

      SUCCESS = "SUCCESS"
      FAILURE = "FAILURE"
    end
  end
end
