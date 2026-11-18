# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserGetResponse defines the response schema for `/user/get`.
    class UserGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false

      field :updated_at, -> { String }, optional: true, nullable: false

      field :identity, -> { Plaid::Types::ClientUserIdentity }, optional: true, nullable: true
    end
  end
end
