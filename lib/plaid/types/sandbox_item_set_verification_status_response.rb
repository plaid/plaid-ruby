# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxItemSetVerificationStatusResponse defines the response schema for `/sandbox/item/set_verification_status`
    class SandboxItemSetVerificationStatusResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
