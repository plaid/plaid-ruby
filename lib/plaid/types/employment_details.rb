# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing employment details found on a paystub.
    class EmploymentDetails < Internal::Types::Model
      field :annual_salary, -> { Plaid::Types::Pay }, optional: true, nullable: false

      field :hire_date, -> { String }, optional: true, nullable: true
    end
  end
end
