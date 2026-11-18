# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserThirdPartyTokenCreateRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: true, nullable: false

        field :third_party_client_id, -> { String }, optional: false, nullable: false

        field :expiration_time, -> { String }, optional: true, nullable: true

        field :user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
