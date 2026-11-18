# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The product access being requested. Used to allow or disallow product access across all accounts. If unset,
    # defaults to all products allowed.
    class ProductAccess < Internal::Types::Model
      field :statements, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :identity, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :auth, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :transactions, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :accounts_details_transactions, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :accounts_routing_number, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :accounts_statements, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :accounts_tax_statements, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :customers_profiles, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
