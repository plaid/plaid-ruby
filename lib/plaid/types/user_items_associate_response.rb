# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserItemsAssociateResponse defines the response schema for `/user/items/associate`
    class UserItemsAssociateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
