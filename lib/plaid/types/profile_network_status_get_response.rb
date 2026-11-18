# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProfileNetworkStatusGetResponse defines the response schema for `/profile/network_status/get`
    class ProfileNetworkStatusGetResponse < Internal::Types::Model
      field :network_status, -> { Plaid::Types::NetworkStatusGetResponseNetworkStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
