# frozen_string_literal: true

module Plaid
  module Identity
    module Types
      class IdentityGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::IdentityGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
