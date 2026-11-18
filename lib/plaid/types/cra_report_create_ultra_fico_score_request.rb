# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration for one UltraFICO scoring request.
    class CraReportCreateUltraFicoScoreRequest < Internal::Types::Model
      field :ultrafico_score_version, -> { Plaid::Types::CraUltraFicoScoreVersion }, optional: false, nullable: false

      field :request_correlation_id, -> { String }, optional: true, nullable: false

      field :fico_scoring_request_id, -> { String }, optional: true, nullable: false

      field :base_fico_score, -> { Plaid::Types::CraReportCreateUltraFicoBaseFicoScore }, optional: false, nullable: false
    end
  end
end
