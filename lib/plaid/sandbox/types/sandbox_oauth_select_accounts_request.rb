# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxOauthSelectAccountsRequest < Internal::Types::Model
        field :oauth_state_id, -> { String }, optional: false, nullable: false

        field :accounts, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
