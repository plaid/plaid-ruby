# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemRemoveResponse defines the response schema for `/item/remove`
    class ItemRemoveResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
