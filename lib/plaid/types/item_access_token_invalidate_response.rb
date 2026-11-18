# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemAccessTokenInvalidateResponse defines the response schema for `/item/access_token/invalidate`
    class ItemAccessTokenInvalidateResponse < Internal::Types::Model
      field :new_access_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
