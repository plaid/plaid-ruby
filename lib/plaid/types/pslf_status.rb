# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the student's eligibility in the Public Service Loan Forgiveness program. This is only returned
    # if the institution is FedLoan (`ins_116527`). Since FedLoan no longer services student loans, this field is no
    # longer returned.
    class PslfStatus < Internal::Types::Model
      field :estimated_eligibility_date, -> { String }, optional: false, nullable: true

      field :payments_made, -> { Integer }, optional: false, nullable: true

      field :payments_remaining, -> { Integer }, optional: false, nullable: true
    end
  end
end
