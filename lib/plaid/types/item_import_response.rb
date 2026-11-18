# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemImportResponse defines the response schema for `/item/import`
    class ItemImportResponse < Internal::Types::Model
      field :access_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
