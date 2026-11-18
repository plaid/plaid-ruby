# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditPayrollIncomeParsingConfigUpdateResponse defines the response schema for
    # `/credit/payroll_income/parsing_config/update`.
    class CreditPayrollIncomeParsingConfigUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
