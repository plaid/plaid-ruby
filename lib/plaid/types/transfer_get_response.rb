# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/get`
    class TransferGetResponse < Internal::Types::Model
      field :transfer, -> { Plaid::Types::Transfer }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
