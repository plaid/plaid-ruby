# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/event/list`
    class TransferEventListResponse < Internal::Types::Model
      field :transfer_events, -> { Internal::Types::Array[Plaid::Types::TransferEvent] }, optional: false, nullable: false

      field :has_more, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
