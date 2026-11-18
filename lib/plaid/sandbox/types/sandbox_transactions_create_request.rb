# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransactionsCreateRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :transactions, -> { Internal::Types::Array[Plaid::Types::CustomSandboxTransaction] }, optional: false, nullable: false
      end
    end
  end
end
