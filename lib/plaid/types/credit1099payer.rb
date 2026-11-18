# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a payer used by 1099-MISC tax documents.
    class Credit1099Payer < Internal::Types::Model
      field :address, -> { Plaid::Types::CreditPayStubAddress }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: true

      field :tin, -> { String }, optional: true, nullable: true

      field :telephone_number, -> { String }, optional: true, nullable: true
    end
  end
end
