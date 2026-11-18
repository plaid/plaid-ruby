# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information specific to a mortgage loan agreement between one or more borrowers and a mortgage lender.
    class Loan < Internal::Types::Model
      field :loan_identifiers, -> { Plaid::Types::LoanIdentifiers }, optional: false, nullable: false, api_name: "LOAN_IDENTIFIERS"
    end
  end
end
