# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RiskCheckEmailName
      extend Plaid::Internal::Types::Enum

      NO_INPUT = "no_input"
      INDETERMINATE = "indeterminate"
      NO_MATCH = "no_match"
      PARTIAL_MATCH = "partial_match"
      MATCH = "match"
      NO_DATA = "no_data"
    end
  end
end
