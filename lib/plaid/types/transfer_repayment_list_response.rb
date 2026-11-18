# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/repayment/list`
    class TransferRepaymentListResponse < Internal::Types::Model
      field :repayments, -> { Internal::Types::Array[Plaid::Types::TransferRepayment] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
