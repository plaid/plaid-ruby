# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying values for `phone` attributes of risk check.
    class RiskCheckPhone < Internal::Types::Model
      field :linked_services, -> { Internal::Types::Array[Plaid::Types::RiskCheckLinkedService] }, optional: false, nullable: false

      field :risk_level, -> { Plaid::Types::RiskLevel }, optional: true, nullable: false

      field :factors, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
