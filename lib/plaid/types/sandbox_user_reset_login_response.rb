# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxUserResetLoginResponse defines the response schema for `/sandbox/user/reset_login`
    class SandboxUserResetLoginResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
