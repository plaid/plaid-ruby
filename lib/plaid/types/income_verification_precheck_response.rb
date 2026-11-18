# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IncomeVerificationPrecheckResponse defines the response schema for `/income/verification/precheck`.
    class IncomeVerificationPrecheckResponse < Internal::Types::Model
      field :precheck_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :confidence, -> { Plaid::Types::IncomeVerificationPrecheckConfidence }, optional: false, nullable: false
    end
  end
end
