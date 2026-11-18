# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemProductsTerminateResponse defines the response schema for `/item/products/terminate`
    class ItemProductsTerminateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
