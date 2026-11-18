# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/originator/get`
    class TransferOriginatorGetResponse < Internal::Types::Model
      field :originator, -> { Plaid::Types::DetailedOriginator }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
