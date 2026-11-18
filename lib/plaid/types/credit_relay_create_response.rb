# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditRelayCreateResponse defines the response schema for `/credit/relay/create`
    class CreditRelayCreateResponse < Internal::Types::Model
      field :relay_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
