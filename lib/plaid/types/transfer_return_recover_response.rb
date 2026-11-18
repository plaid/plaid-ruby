# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/return/recover`
    class TransferReturnRecoverResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
