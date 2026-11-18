# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/sweep/list`
    class TransferSweepListResponse < Internal::Types::Model
      field :sweeps, -> { Internal::Types::Array[Plaid::Types::TransferSweep] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
