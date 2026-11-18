# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SandboxTransferRfpSimulateAction
      extend Plaid::Internal::Types::Enum

      APPROVE = "approve"
      REJECT = "reject"
    end
  end
end
