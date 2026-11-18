# frozen_string_literal: true

module Plaid
  module Identity
    module Types
      class IdentityMatchRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :user, -> { Plaid::Types::IdentityMatchUser }, optional: true, nullable: false

        field :options, -> { Plaid::Types::IdentityMatchRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
