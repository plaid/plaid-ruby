# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SignalPrepareResponse defines the response schema for `/signal/prepare`
    class SignalPrepareResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
