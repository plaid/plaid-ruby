# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IncomeVerificationTaxformsGetResponse defines the response schema for `/income/verification/taxforms/get`
    class IncomeVerificationTaxformsGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: true, nullable: false

      field :document_metadata, -> { Internal::Types::Array[Plaid::Types::DocumentMetadata] }, optional: false, nullable: false

      field :taxforms, -> { Internal::Types::Array[Plaid::Types::Taxform] }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true
    end
  end
end
