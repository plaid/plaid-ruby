# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the end user. Required if a root-level `user_id` is not provided.
    class SessionTokenCreateRequestUser < Internal::Types::Model
      field :client_user_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false
    end
  end
end
