# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserUpdateResponse defines the response schema for `/user/update`
    class UserUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
