# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A filter to apply to `loan`-type accounts
    class LinkTokenCreateLoanFilter < Internal::Types::Model
      field :account_subtypes, -> { Internal::Types::Array[Plaid::Types::LoanAccountSubtype] }, optional: true, nullable: false
    end
  end
end
