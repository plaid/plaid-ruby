# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/list`
    class TransferListResponse < Internal::Types::Model
      field :transfers, -> { Internal::Types::Array[Plaid::Types::Transfer] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
