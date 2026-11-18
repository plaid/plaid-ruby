# frozen_string_literal: true

module Plaid
  module OAuth
    module Types
      class OAuthRevokeRequest < Internal::Types::Model
        field :token, -> { String }, optional: false, nullable: false

        field :client_secret, -> { String }, optional: true, nullable: false
      end
    end
  end
end
