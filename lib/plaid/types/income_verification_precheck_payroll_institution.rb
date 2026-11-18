# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the end user's payroll institution
    class IncomeVerificationPrecheckPayrollInstitution < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true
    end
  end
end
