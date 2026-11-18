# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferIntentAuthorizationDecision
      extend Plaid::Internal::Types::Enum

      APPROVED = "APPROVED"
      DECLINED = "DECLINED"
    end
  end
end
