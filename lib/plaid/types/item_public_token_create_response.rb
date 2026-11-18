# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemPublicTokenCreateResponse defines the response schema for `/item/public_token/create`
    class ItemPublicTokenCreateResponse < Internal::Types::Model
      field :public_token, -> { String }, optional: false, nullable: false

      field :expiration, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
