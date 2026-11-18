# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module MatchSummaryCode
      extend Plaid::Internal::Types::Enum

      MATCH = "match"
      PARTIAL_MATCH = "partial_match"
      NO_MATCH = "no_match"
      NO_DATA = "no_data"
      NO_INPUT = "no_input"
    end
  end
end
