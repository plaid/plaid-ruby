# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object for `/credit/bank_income/get` request options.
    class CreditBankIncomeGetRequestOptions < Internal::Types::Model
      field :count, -> { Integer }, optional: true, nullable: false
    end
  end
end
