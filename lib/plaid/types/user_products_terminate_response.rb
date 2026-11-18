# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserProductsTerminateResponse defines the response schema for `/user/products/terminate`
    class UserProductsTerminateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
