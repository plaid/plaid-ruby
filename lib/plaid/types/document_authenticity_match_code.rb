# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module DocumentAuthenticityMatchCode
      extend Plaid::Internal::Types::Enum

      MATCH = "match"
      PARTIAL_MATCH = "partial_match"
      NO_MATCH = "no_match"
      NO_DATA = "no_data"
    end
  end
end
