# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/sweep/get`
    class TransferSweepGetResponse < Internal::Types::Model
      field :sweep, -> { Plaid::Types::TransferSweep }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
