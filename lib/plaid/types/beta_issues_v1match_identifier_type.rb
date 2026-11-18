# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BetaIssuesV1MatchIdentifierType
      extend Plaid::Internal::Types::Enum

      ITEM_ID = "ITEM_ID"
      REQUEST_ID = "REQUEST_ID"
      LINK_SESSION_ID = "LINK_SESSION_ID"
      ACCOUNT_ID = "ACCOUNT_ID"
    end
  end
end
