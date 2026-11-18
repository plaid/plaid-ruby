# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the employer on the pay stub.
    class CreditPayStubEmployer < Internal::Types::Model
      field :address, -> { Plaid::Types::CreditPayStubAddress }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true
    end
  end
end
