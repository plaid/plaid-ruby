# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Collection of current and previous identifiers for this loan.
    class LoanIdentifiers < Internal::Types::Model
      field :loan_identifier, -> { Plaid::Types::LoanIdentifier }, optional: false, nullable: false, api_name: "LOAN_IDENTIFIER"
    end
  end
end
