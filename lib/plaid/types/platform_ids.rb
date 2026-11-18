# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing a set of ids related to an employee
    class PlatformIDs < Internal::Types::Model
      field :employee_id, -> { String }, optional: true, nullable: true

      field :payroll_id, -> { String }, optional: true, nullable: true

      field :position_id, -> { String }, optional: true, nullable: true
    end
  end
end
