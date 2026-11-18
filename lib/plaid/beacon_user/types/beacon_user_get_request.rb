# frozen_string_literal: true

module Plaid
  module BeaconUser
    module Types
      class BeaconUserGetRequest < Internal::Types::Model
        field :beacon_user_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
