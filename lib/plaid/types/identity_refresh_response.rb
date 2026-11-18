# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IdentityRefreshResponse defines the response schema for `/identity/refresh`
    class IdentityRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
