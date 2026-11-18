# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # RiskProfile is deprecated, use `ruleset` instead.
    class RiskProfile < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false

      field :outcome, -> { String }, optional: true, nullable: false
    end
  end
end
