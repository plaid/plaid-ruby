# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The `account_filters` specified in the original call to `/link/token/create`.
    class AccountFiltersResponse < Internal::Types::Model
      field :depository, -> { Plaid::Types::DepositoryFilter }, optional: true, nullable: true

      field :credit, -> { Plaid::Types::CreditFilter }, optional: true, nullable: true

      field :loan, -> { Plaid::Types::LoanFilter }, optional: true, nullable: true

      field :investment, -> { Plaid::Types::InvestmentFilter }, optional: true, nullable: true
    end
  end
end
