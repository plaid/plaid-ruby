# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A filter to apply to `loan`-type accounts
    class LoanFilter < Internal::Types::Model
      field :account_subtypes, -> { Internal::Types::Array[Plaid::Types::LoanAccountSubtype] }, optional: false, nullable: false
    end
  end
end
