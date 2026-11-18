# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SelfieAnalysisDocumentComparison
      extend Plaid::Internal::Types::Enum

      MATCH = "match"
      NO_MATCH = "no_match"
      NO_INPUT = "no_input"
    end
  end
end
