# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserThirdPartyTokenCreateResponse defines the response schema for `/user/third_party_token/create`
    class UserThirdPartyTokenCreateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :third_party_user_token, -> { String }, optional: false, nullable: false
    end
  end
end
