# frozen_string_literal: true

module Plaid
  module Identity
    module Types
      class IdentityRefreshRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
