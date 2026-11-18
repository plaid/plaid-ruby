# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferTestClockGetRequest < Internal::Types::Model
        field :test_clock_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
