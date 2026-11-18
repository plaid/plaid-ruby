# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing fraud risk data pertaining to the Item linked as part of the verification.
    class PayrollRiskSignalsItem < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :verification_risk_signals, -> { Internal::Types::Array[Plaid::Types::DocumentRiskSignalsObject] }, optional: false, nullable: false
    end
  end
end
