# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxItemResetLoginResponse defines the response schema for `/sandbox/item/reset_login`
    class SandboxItemResetLoginResponse < Internal::Types::Model
      field :reset_login, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
