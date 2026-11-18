# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserItemsRemoveResponse defines the response schema for `/user/items/remove`
    class UserItemsRemoveResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
