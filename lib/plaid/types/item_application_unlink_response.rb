# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ItemApplicationUnlinkResponse defines the response schema for `/item/application/unlink`
    class ItemApplicationUnlinkResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
