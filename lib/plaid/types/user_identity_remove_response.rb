# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserIdentityRemoveResponse defines the response schema for `/user/identity/remove`
    class UserIdentityRemoveResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
