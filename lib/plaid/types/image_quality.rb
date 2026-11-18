# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ImageQuality
      extend Plaid::Internal::Types::Enum

      HIGH = "high"
      MEDIUM = "medium"
      LOW = "low"
    end
  end
end
