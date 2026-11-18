# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ConsumerDisputeCategory
      extend Plaid::Internal::Types::Enum

      TRANSACTION = "TRANSACTION"
      BALANCE = "BALANCE"
      IDENTITY = "IDENTITY"
      OTHER = "OTHER"
    end
  end
end
