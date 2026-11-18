# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration required to generate a single UltraFICO® score.
    class CraPartnerInsightsUltraFicoScoreRequest < Internal::Types::Model
      field :ultrafico_score_version, -> { Plaid::Types::CraPartnerInsightsUltraFicoScoreVersion }, optional: false, nullable: false

      field :fico_scoring_request_id, -> { String }, optional: true, nullable: false

      field :request_correlation_id, -> { String }, optional: true, nullable: false

      field :base_fico_score, -> { Plaid::Types::CraPartnerInsightsBaseFicoScore }, optional: false, nullable: false
    end
  end
end
