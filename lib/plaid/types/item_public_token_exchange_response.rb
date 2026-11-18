# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemPublicTokenExchangeResponse defines the response schema for `/item/public_token/exchange`
    class ItemPublicTokenExchangeResponse < Internal::Types::Model
      field :access_token, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
