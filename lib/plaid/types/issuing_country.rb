# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IssuingCountry
      extend Plaid::Internal::Types::Enum

      MATCH = "match"
      NO_MATCH = "no_match"
    end
  end
end
