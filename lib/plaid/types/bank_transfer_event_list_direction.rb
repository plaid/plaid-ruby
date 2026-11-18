# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BankTransferEventListDirection
      extend Plaid::Internal::Types::Enum

      INBOUND = "inbound"
      OUTBOUND = "outbound"
    end
  end
end
