# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The schema below describes the various `types` and corresponding `subtypes` that Plaid recognizes and reports for
    # financial institution accounts. For a mapping of supported types and subtypes to Plaid products, see the [Account
    # type / product support matrix](https://plaid.com/docs/api/accounts/#account-type--product-support-matrix).
    class StandaloneAccountType < Internal::Types::Model
      field :depository, -> { String }, optional: false, nullable: false

      field :credit, -> { String }, optional: false, nullable: false

      field :loan, -> { String }, optional: false, nullable: false

      field :investment, -> { String }, optional: false, nullable: false

      field :payroll, -> { String }, optional: true, nullable: false

      field :other, -> { String }, optional: false, nullable: false
    end
  end
end
