# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditBankIncomeRefreshResponse defines the response schema for `/credit/bank_income/refresh`.
    class CreditBankIncomeRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
