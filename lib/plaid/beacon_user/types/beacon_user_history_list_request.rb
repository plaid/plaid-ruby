# frozen_string_literal: true

module Plaid
  module BeaconUser
    module Types
      class BeaconUserHistoryListRequest < Internal::Types::Model
        field :beacon_user_id, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
