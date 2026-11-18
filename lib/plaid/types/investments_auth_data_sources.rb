# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object with metadata pertaining to the source of data for the account numbers, owners, and holdings that are
    # returned.
    class InvestmentsAuthDataSources < Internal::Types::Model
      field :numbers, -> { Plaid::Types::DataSources }, optional: true, nullable: false

      field :owners, -> { Plaid::Types::DataSources }, optional: true, nullable: false

      field :holdings, -> { Plaid::Types::DataSources }, optional: true, nullable: false
    end
  end
end
