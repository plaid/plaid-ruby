# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The result of a single UltraFICO® score generation request.
    class CraPartnerInsightsUltraFicoScoreResult < Internal::Types::Model
      field :request_correlation_id, -> { String }, optional: true, nullable: false

      field :fico_scoring_request_id, -> { String }, optional: true, nullable: false

      field :ultrafico_score, -> { Plaid::Types::CraPartnerInsightsUltraFicoScore }, optional: true, nullable: true

      field :error_reason, -> { String }, optional: true, nullable: false

      field :exclusion_code, -> { String }, optional: true, nullable: true
    end
  end
end
