# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RuleResult
      extend Plaid::Internal::Types::Enum

      ACCEPT = "ACCEPT"
      REROUTE = "REROUTE"
      REVIEW = "REVIEW"
    end
  end
end
