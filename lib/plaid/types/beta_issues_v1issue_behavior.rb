# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BetaIssuesV1IssueBehavior
      extend Plaid::Internal::Types::Enum

      NEW_CONNECTIONS_CANNOT_BE_ESTABLISHED = "NEW_CONNECTIONS_CANNOT_BE_ESTABLISHED"
      EXISTING_CONNECTIONS_WILL_NOT_RECEIVE_UPDATES = "EXISTING_CONNECTIONS_WILL_NOT_RECEIVE_UPDATES"
      EXISTING_CONNECTIONS_WILL_BE_DISCONNECTED = "EXISTING_CONNECTIONS_WILL_BE_DISCONNECTED"
    end
  end
end
