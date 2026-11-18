# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/repayment/return/list`
    class TransferRepaymentReturnListResponse < Internal::Types::Model
      field :repayment_returns, -> { Internal::Types::Array[Plaid::Types::TransferRepaymentReturn] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
