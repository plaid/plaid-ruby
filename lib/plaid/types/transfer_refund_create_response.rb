# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/refund/create`
    class TransferRefundCreateResponse < Internal::Types::Model
      field :refund, -> { Plaid::Types::TransferRefund }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
