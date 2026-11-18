# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferSimulateRequest < Internal::Types::Model
        field :transfer_id, -> { String }, optional: false, nullable: false

        field :test_clock_id, -> { String }, optional: true, nullable: true

        field :event_type, -> { String }, optional: false, nullable: false

        field :failure_reason, -> { Plaid::Types::TransferFailure }, optional: true, nullable: true

        field :webhook, -> { String }, optional: true, nullable: false
      end
    end
  end
end
