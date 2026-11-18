# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a filer used by 1099-K tax documents.
    class Credit1099Filer < Internal::Types::Model
      field :address, -> { Plaid::Types::CreditPayStubAddress }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: true

      field :tin, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true
    end
  end
end
