# frozen_string_literal: true

module Plaid
  module BeaconUser
    module Types
      class BeaconUserAccountInsightsGetRequest < Internal::Types::Model
        field :beacon_user_id, -> { String }, optional: false, nullable: false

        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
