# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferAuthorizationDecision
      extend Plaid::Internal::Types::Enum

      APPROVED = "approved"
      DECLINED = "declined"
      USER_ACTION_REQUIRED = "user_action_required"
    end
  end
end
