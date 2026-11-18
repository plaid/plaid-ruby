# frozen_string_literal: true

module Plaid
  module Loans
    module Types
      class CraLoansRegisterRequest < Internal::Types::Model
        field :loans, -> { Internal::Types::Array[Plaid::Types::CraLoanRegister] }, optional: false, nullable: false
      end
    end
  end
end
