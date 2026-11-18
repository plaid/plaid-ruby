# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AamvaMatchResult
      extend Plaid::Internal::Types::Enum

      MATCH = "match"
      NO_MATCH = "no_match"
      NO_DATA = "no_data"
    end
  end
end
