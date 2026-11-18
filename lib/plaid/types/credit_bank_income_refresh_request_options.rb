# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object for `/credit/bank_income/refresh` request options.
    class CreditBankIncomeRefreshRequestOptions < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: true, nullable: false
    end
  end
end
