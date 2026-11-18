# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxItemApplicationSeedResponse defines the response schema for `/sandbox/item/application/seed`
    class SandboxItemApplicationSeedResponse < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
