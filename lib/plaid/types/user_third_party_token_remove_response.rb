# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserThirdPartyTokenRemoveResponse defines the response schema for `/user/third_party_token/remove`
    class UserThirdPartyTokenRemoveResponse < Internal::Types::Model
      field :removed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
