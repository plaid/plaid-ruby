# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information specific to a mortgage loan agreement between one or more borrowers and a mortgage lender.
    class CreditFreddieMacLoan < Internal::Types::Model
      field :loan_identifiers, -> { Plaid::Types::CreditFreddieMacLoanIdentifiers }, optional: false, nullable: false, api_name: "LOAN_IDENTIFIERS"

      field :loan_role_type, -> { String }, optional: false, nullable: false, api_name: "LoanRoleType"
    end
  end
end
