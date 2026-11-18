# frozen_string_literal: true

module Plaid
  module Auth
    module Types
      class AuthGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::AuthGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
