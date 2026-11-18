# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxItemResetLoginRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
