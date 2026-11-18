# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The details of a digital payroll income verification in Link
    class CreditSessionPayrollIncomeResult < Internal::Types::Model
      field :num_paystubs_retrieved, -> { Integer }, optional: true, nullable: false

      field :num_w2s_retrieved, -> { Integer }, optional: true, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: false

      field :institution_name, -> { String }, optional: true, nullable: false
    end
  end
end
