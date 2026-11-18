# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserThirdPartyTokenRemoveRequest < Internal::Types::Model
        field :third_party_user_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
