# frozen_string_literal: true

module Plaid
  module Loans
    module Types
      class CraLoansUnregisterRequest < Internal::Types::Model
        field :loans, -> { Internal::Types::Array[Plaid::Types::CraLoanUnregister] }, optional: false, nullable: false
      end
    end
  end
end
