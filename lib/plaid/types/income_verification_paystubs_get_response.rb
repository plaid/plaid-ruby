# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IncomeVerificationPaystubsGetResponse defines the response schema for `/income/verification/paystubs/get`.
    class IncomeVerificationPaystubsGetResponse < Internal::Types::Model
      field :document_metadata, -> { Internal::Types::Array[Plaid::Types::DocumentMetadata] }, optional: true, nullable: false

      field :paystubs, -> { Internal::Types::Array[Plaid::Types::Paystub] }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
