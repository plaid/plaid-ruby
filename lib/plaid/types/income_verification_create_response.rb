# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IncomeVerificationCreateResponse defines the response schema for `/income/verification/create`.
    class IncomeVerificationCreateResponse < Internal::Types::Model
      field :income_verification_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
