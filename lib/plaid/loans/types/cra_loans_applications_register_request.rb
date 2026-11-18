# frozen_string_literal: true

module Plaid
  module Loans
    module Types
      class CraLoansApplicationsRegisterRequest < Internal::Types::Model
        field :applications, -> { Internal::Types::Array[Plaid::Types::CraLoanApplication] }, optional: false, nullable: false
      end
    end
  end
end
