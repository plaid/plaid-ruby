# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # LendScore data returned by `/cra/report/get`.
    class CraReportGetLendScoreResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetLendScoreMetadata }, optional: false, nullable: true

      field :scores, -> { Internal::Types::Array[Plaid::Types::CraReportGetLendScoreVariantScore] }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
