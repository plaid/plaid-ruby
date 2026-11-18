# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferSweepSimulateRequest < Internal::Types::Model
        field :test_clock_id, -> { String }, optional: true, nullable: true

        field :webhook, -> { String }, optional: true, nullable: false
      end
    end
  end
end
