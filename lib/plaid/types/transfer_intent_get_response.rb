# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/intent/get`
    class TransferIntentGetResponse < Internal::Types::Model
      field :transfer_intent, -> { Plaid::Types::TransferIntentGet }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
