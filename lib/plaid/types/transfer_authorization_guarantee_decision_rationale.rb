# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The rationale for Plaid's decision to not guarantee a transfer. Will be `null` unless `guarantee_decision` is
    # `NOT_GUARANTEED`.
    class TransferAuthorizationGuaranteeDecisionRationale < Internal::Types::Model
      field :code, -> { Plaid::Types::TransferAuthorizationGuaranteeDecisionRationaleCode }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false
    end
  end
end
