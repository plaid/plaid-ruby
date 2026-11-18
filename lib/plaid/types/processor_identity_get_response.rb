# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorIdentityGetResponse defines the response schema for `/processor/identity/get`
    class ProcessorIdentityGetResponse < Internal::Types::Model
      field :account, -> { Plaid::Types::AccountIdentity }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
