# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BetaIssuesV1IssueAttribution
      extend Plaid::Internal::Types::Enum

      USER = "USER"
      PLAID = "PLAID"
      DATA_PARTNER = "DATA_PARTNER"
    end
  end
end
