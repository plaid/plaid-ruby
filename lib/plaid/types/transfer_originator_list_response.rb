# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/originator/list`
    class TransferOriginatorListResponse < Internal::Types::Model
      field :originators, -> { Internal::Types::Array[Plaid::Types::Originator] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
