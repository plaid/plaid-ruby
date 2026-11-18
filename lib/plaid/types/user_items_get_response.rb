# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserItemsGetResponse defines the response schema for `/user/items/get`
    class UserItemsGetResponse < Internal::Types::Model
      field :items, -> { Internal::Types::Array[Plaid::Types::Item] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
