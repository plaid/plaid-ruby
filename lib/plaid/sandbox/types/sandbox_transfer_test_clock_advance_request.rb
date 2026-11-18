# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferTestClockAdvanceRequest < Internal::Types::Model
        field :test_clock_id, -> { String }, optional: false, nullable: false

        field :new_virtual_time, -> { String }, optional: false, nullable: false
      end
    end
  end
end
