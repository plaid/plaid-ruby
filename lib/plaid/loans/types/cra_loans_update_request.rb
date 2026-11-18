# frozen_string_literal: true

module Plaid
  module Loans
    module Types
      class CraLoansUpdateRequest < Internal::Types::Model
        field :loans, -> { Internal::Types::Array[Plaid::Types::CraLoanUpdate] }, optional: false, nullable: false
      end
    end
  end
end
