# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Affordability insights focus on providing signal on the ability of a borrower to repay their loan without
    # experiencing financial strain. It provides insights on factors such as a user's monthly income and expenses,
    # disposable income, average expenditure, etc., helping lenders gauge the level of affordability of a borrower.
    class AffordabilityInsights < Internal::Types::Model
      field :expenditure, -> { Plaid::Types::ExpenditureInsights }, optional: true, nullable: true

      field :income, -> { Plaid::Types::IncomeInsights }, optional: true, nullable: true
    end
  end
end
