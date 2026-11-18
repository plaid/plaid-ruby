# frozen_string_literal: true

module Plaid
  module BeaconUser
    module Types
      class BeaconUserUpdateRequest < Internal::Types::Model
        field :beacon_user_id, -> { String }, optional: false, nullable: false

        field :user, -> { Plaid::Types::BeaconUserUpdateRequestData }, optional: true, nullable: true

        field :access_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: true
      end
    end
  end
end
