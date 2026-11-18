# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemGetResponse defines the response schema for `/item/get` and `/item/webhook/update`
    class ItemGetResponse < Internal::Types::Model
      field :item, -> { Plaid::Types::ItemWithConsentFields }, optional: false, nullable: false

      field :status, -> { Plaid::Types::ItemStatusNullable }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
