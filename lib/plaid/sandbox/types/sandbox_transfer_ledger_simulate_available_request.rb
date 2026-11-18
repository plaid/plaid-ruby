# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferLedgerSimulateAvailableRequest < Internal::Types::Model
        field :ledger_id, -> { String }, optional: true, nullable: true

        field :originator_client_id, -> { String }, optional: true, nullable: true

        field :test_clock_id, -> { String }, optional: true, nullable: true

        field :webhook, -> { String }, optional: true, nullable: false
      end
    end
  end
end
