# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserRemoveResponse defines the response schema for `/user/remove`
    class UserRemoveResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
