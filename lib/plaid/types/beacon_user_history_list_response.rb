# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The response schema for `/beacon/user/history/list`
    class BeaconUserHistoryListResponse < Internal::Types::Model
      field :beacon_users, -> { Internal::Types::Array[Plaid::Types::BeaconUser] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
