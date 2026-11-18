# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The object containing a set of ids related to an employee.
    class CreditPlatformIDs < Internal::Types::Model
      field :employee_id, -> { String }, optional: false, nullable: true

      field :payroll_id, -> { String }, optional: false, nullable: true

      field :position_id, -> { String }, optional: false, nullable: true
    end
  end
end
