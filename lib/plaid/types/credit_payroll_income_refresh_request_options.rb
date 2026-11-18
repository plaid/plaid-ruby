# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object for `/credit/payroll_income/refresh` request options.
    class CreditPayrollIncomeRefreshRequestOptions < Internal::Types::Model
      field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :webhook, -> { String }, optional: true, nullable: false
    end
  end
end
