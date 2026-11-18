# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The result of one UltraFICO scoring request.
    class CraReportGetUltraFicoScoreResult < Internal::Types::Model
      field :request_correlation_id, -> { String }, optional: false, nullable: true

      field :fico_scoring_request_id, -> { String }, optional: false, nullable: true

      field :ultrafico_score, -> { Plaid::Types::CraReportGetUltraFicoScore }, optional: false, nullable: true

      field :error_reason, -> { String }, optional: false, nullable: true

      field :exclusion_code, -> { String }, optional: false, nullable: true
    end
  end
end
