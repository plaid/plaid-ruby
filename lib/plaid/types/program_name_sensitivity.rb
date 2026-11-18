# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ProgramNameSensitivity
      extend Plaid::Internal::Types::Enum

      COARSE = "coarse"
      BALANCED = "balanced"
      STRICT = "strict"
      EXACT = "exact"
    end
  end
end
