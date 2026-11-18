# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxPublicTokenCreateResponse defines the response schema for `/sandbox/public_token/create`
    class SandboxPublicTokenCreateResponse < Internal::Types::Model
      field :public_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
