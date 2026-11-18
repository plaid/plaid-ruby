# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a recipient used in both 1099-K and 1099-MISC tax documents.
    class Credit1099Recipient < Internal::Types::Model
      field :address, -> { Plaid::Types::CreditPayStubAddress }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: true

      field :tin, -> { String }, optional: true, nullable: true

      field :account_number, -> { String }, optional: true, nullable: true

      field :facta_filing_requirement, -> { String }, optional: true, nullable: true

      field :second_tin_exists, -> { String }, optional: true, nullable: true
    end
  end
end
