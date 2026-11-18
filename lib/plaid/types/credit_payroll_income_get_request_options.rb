# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object for `/credit/payroll_income/get` request options.
    class CreditPayrollIncomeGetRequestOptions < Internal::Types::Model
      field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
