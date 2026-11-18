# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RecommendationString
      extend Plaid::Internal::Types::Enum

      RECOMMENDED = "RECOMMENDED"
      NOT_RECOMMENDED = "NOT_RECOMMENDED"
      UNKNOWN = "UNKNOWN"
    end
  end
end
