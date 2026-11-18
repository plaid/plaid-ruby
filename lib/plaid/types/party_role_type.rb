# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PartyRoleType
      extend Plaid::Internal::Types::Enum

      BORROWER = "Borrower"
    end
  end
end
