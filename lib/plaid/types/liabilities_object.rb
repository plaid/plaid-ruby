# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing liability accounts
    class LiabilitiesObject < Internal::Types::Model
      field :credit, -> { Internal::Types::Array[Plaid::Types::CreditCardLiability] }, optional: false, nullable: true

      field :mortgage, -> { Internal::Types::Array[Plaid::Types::MortgageLiability] }, optional: false, nullable: true

      field :student, -> { Internal::Types::Array[Plaid::Types::StudentLoan] }, optional: false, nullable: true

      field :loan, -> { Internal::Types::Array[Plaid::Types::LoanLiability] }, optional: true, nullable: true

      field :line_of_credit, -> { Internal::Types::Array[Plaid::Types::LineOfCreditLiability] }, optional: true, nullable: true
    end
  end
end
