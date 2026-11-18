# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferEventListTransferType
      extend Plaid::Internal::Types::Enum

      DEBIT = "debit"
      CREDIT = "credit"
    end
  end
end
