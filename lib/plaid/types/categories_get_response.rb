# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CategoriesGetResponse defines the response schema for `/categories/get`
    class CategoriesGetResponse < Internal::Types::Model
      field :categories, -> { Internal::Types::Array[Plaid::Types::Category] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
