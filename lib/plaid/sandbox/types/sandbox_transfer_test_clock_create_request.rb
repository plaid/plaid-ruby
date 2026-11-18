# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferTestClockCreateRequest < Internal::Types::Model
        field :virtual_time, -> { String }, optional: true, nullable: true
      end
    end
  end
end
