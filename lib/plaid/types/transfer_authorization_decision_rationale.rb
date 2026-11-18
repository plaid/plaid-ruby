# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The rationale for Plaid's decision regarding a proposed transfer. It is always set for `declined` decisions, and
    # may or may not be null for `approved` decisions.
    class TransferAuthorizationDecisionRationale < Internal::Types::Model
      field :code, -> { Plaid::Types::TransferAuthorizationDecisionRationaleCode }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false
    end
  end
end
