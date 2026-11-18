# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The information used to identify this loan by various parties to the transaction or other organizations.
    class LoanIdentifier < Internal::Types::Model
      field :loan_identifier, -> { String }, optional: false, nullable: true, api_name: "LoanIdentifier"

      field :loan_identifier_type, -> { Plaid::Types::LoanIdentifierType }, optional: false, nullable: true, api_name: "LoanIdentifierType"
    end
  end
end
