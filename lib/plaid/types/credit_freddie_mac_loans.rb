# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of loans that are part of a single deal.
    class CreditFreddieMacLoans < Internal::Types::Model
      field :loan, -> { Plaid::Types::CreditFreddieMacLoan }, optional: false, nullable: false, api_name: "LOAN"
    end
  end
end
