# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxCraServicingSimulateRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::SandboxCraServicingSimulateRequestOptions }, optional: true, nullable: true
      end
    end
  end
end
