# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/intent/create`
    class TransferIntentCreateResponse < Internal::Types::Model
      field :transfer_intent, -> { Plaid::Types::TransferIntentCreate }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
