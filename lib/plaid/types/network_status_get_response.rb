# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # NetworkStatusGetResponse defines the response schema for `/network/status/get`
    class NetworkStatusGetResponse < Internal::Types::Model
      field :network_status, -> { Plaid::Types::NetworkStatusGetResponseNetworkStatus }, optional: false, nullable: false

      field :layer, -> { Plaid::Types::NetworkStatusGetResponseLayer }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
