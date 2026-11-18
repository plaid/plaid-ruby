# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxBankTransferSimulateRequest < Internal::Types::Model
        field :bank_transfer_id, -> { String }, optional: false, nullable: false

        field :event_type, -> { String }, optional: false, nullable: false

        field :failure_reason, -> { Plaid::Types::BankTransferFailure }, optional: true, nullable: true
      end
    end
  end
end
