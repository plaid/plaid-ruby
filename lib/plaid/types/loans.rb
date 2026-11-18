# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of loans that are part of a single deal.
    class Loans < Internal::Types::Model
      field :loan, -> { Plaid::Types::Loan }, optional: false, nullable: false, api_name: "LOAN"
    end
  end
end
