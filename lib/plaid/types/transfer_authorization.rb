# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains the authorization decision for a proposed transfer.
    class TransferAuthorization < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :decision, -> { Plaid::Types::TransferAuthorizationDecision }, optional: false, nullable: false

      field :decision_rationale, -> { Plaid::Types::TransferAuthorizationDecisionRationale }, optional: false, nullable: true

      field :guarantee_decision, -> { Plaid::Types::TransferAuthorizationGuaranteeDecision }, optional: false, nullable: true

      field :guarantee_decision_rationale, -> { Plaid::Types::TransferAuthorizationGuaranteeDecisionRationale }, optional: false, nullable: true

      field :guarantee_details, -> { Plaid::Types::AuthorizationGuaranteeDetails }, optional: true, nullable: true

      field :payment_risk, -> { Plaid::Types::TransferAuthorizationPaymentRisk }, optional: false, nullable: true

      field :proposed_transfer, -> { Plaid::Types::TransferAuthorizationProposedTransfer }, optional: false, nullable: false
    end
  end
end
