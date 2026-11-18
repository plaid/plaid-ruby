# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransactionsUpdateStatus
      extend Plaid::Internal::Types::Enum

      TRANSACTIONS_UPDATE_STATUS_UNKNOWN = "TRANSACTIONS_UPDATE_STATUS_UNKNOWN"
      NOT_READY = "NOT_READY"
      INITIAL_UPDATE_COMPLETE = "INITIAL_UPDATE_COMPLETE"
      HISTORICAL_UPDATE_COMPLETE = "HISTORICAL_UPDATE_COMPLETE"
    end
  end
end
