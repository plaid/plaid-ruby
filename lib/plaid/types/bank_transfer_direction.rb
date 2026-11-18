# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BankTransferDirection
      extend Plaid::Internal::Types::Enum

      OUTBOUND = "outbound"
      INBOUND = "inbound"
    end
  end
end
