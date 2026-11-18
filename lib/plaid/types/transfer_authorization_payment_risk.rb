# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This object includes the scores and risk level. This response is offered as an add-on to
    # `/transfer/authorization/create`. To request access to these fields, please contact your Plaid account manager.
    class TransferAuthorizationPaymentRisk < Internal::Types::Model
      field :bank_initiated_return_score, -> { Integer }, optional: false, nullable: true

      field :customer_initiated_return_score, -> { Integer }, optional: false, nullable: true

      field :risk_level, -> { Plaid::Types::TransferAuthorizationRiskLevel }, optional: false, nullable: true

      field :warnings, -> { Internal::Types::Array[Plaid::Types::SignalWarning] }, optional: false, nullable: false
    end
  end
end
