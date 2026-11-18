# frozen_string_literal: true

module Plaid
  module BeaconUser
    module Types
      class BeaconUserReviewRequest < Internal::Types::Model
        field :beacon_user_id, -> { String }, optional: false, nullable: false

        field :status, -> { Plaid::Types::BeaconUserStatus }, optional: false, nullable: false
      end
    end
  end
end
