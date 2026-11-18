# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/recurring/create`
    class TransferRecurringCreateResponse < Internal::Types::Model
      field :recurring_transfer, -> { Plaid::Types::RecurringTransferNullable }, optional: true, nullable: false

      field :decision, -> { Plaid::Types::TransferAuthorizationDecision }, optional: false, nullable: false

      field :decision_rationale, -> { Plaid::Types::TransferAuthorizationDecisionRationale }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
