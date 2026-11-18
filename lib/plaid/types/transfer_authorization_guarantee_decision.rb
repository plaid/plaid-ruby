# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferAuthorizationGuaranteeDecision
      extend Plaid::Internal::Types::Enum

      GUARANTEED = "GUARANTEED"
      NOT_GUARANTEED = "NOT_GUARANTEED"
    end
  end
end
