# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferIntentStatus
      extend Plaid::Internal::Types::Enum

      PENDING = "PENDING"
      SUCCEEDED = "SUCCEEDED"
      FAILED = "FAILED"
    end
  end
end
