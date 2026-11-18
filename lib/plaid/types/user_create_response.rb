# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserCreateResponse defines the response schema for `/user/create`
    class UserCreateResponse < Internal::Types::Model
      field :user_token, -> { String }, optional: true, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
