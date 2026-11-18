# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/recurring/list`
    class TransferRecurringListResponse < Internal::Types::Model
      field :recurring_transfers, -> { Internal::Types::Array[Plaid::Types::RecurringTransfer] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
