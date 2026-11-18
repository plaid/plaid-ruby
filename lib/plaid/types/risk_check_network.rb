# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying values for network attributes of risk check.
    class RiskCheckNetwork < Internal::Types::Model
      field :risk_level, -> { Plaid::Types::RiskLevel }, optional: false, nullable: false

      field :factors, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
