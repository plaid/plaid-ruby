# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of information about a single party to a transaction. Includes direct participants like the borrower
    # and seller as well as indirect participants such as the flood certificate provider.
    class Party < Internal::Types::Model
      field :individual, -> { Plaid::Types::PartyIndividual }, optional: false, nullable: false, api_name: "INDIVIDUAL"

      field :roles, -> { Plaid::Types::Roles }, optional: false, nullable: false, api_name: "ROLES"

      field :taxpayer_identifiers, -> { Plaid::Types::TaxpayerIdentifiers }, optional: false, nullable: false, api_name: "TAXPAYER_IDENTIFIERS"
    end
  end
end
