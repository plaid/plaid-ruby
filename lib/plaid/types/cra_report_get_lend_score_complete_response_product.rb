# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # LendScore Complete data returned by `/cra/report/get`.
    class CraReportGetLendScoreCompleteResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetLendScoreCompleteMetadata }, optional: false, nullable: true

      field :attributes, -> { Plaid::Types::CraReportGetLendScoreCompleteAttributes }, optional: false, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraReportGetLendScoreCompleteItem] }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
