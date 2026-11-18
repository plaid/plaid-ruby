# frozen_string_literal: true

module Plaid
  module BeaconUser
    module Types
      class BeaconUserCreateRequest < Internal::Types::Model
        field :program_id, -> { String }, optional: false, nullable: false

        field :client_user_id, -> { String }, optional: false, nullable: false

        field :user, -> { Plaid::Types::BeaconUserRequestData }, optional: false, nullable: false

        field :access_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: true
      end
    end
  end
end
