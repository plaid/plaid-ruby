# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditBankIncomeGetResponse defines the response schema for `/credit/bank_income/get`
    class CreditBankIncomeGetResponse < Internal::Types::Model
      field :bank_income, -> { Internal::Types::Array[Plaid::Types::CreditBankIncome] }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
