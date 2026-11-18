# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The calculated UltraFICO® scores returned as part of the Partner Insights report.
    class CraPartnerInsightsFicoResults < Internal::Types::Model
      field :lender_application_id, -> { String }, optional: false, nullable: false

      field :ultrafico_score_results, -> { Internal::Types::Array[Plaid::Types::CraPartnerInsightsUltraFicoScoreResult] }, optional: false, nullable: false

      field :report_characteristics, -> { Plaid::Types::CraPartnerInsightsFicoReportCharacteristics }, optional: true, nullable: true
    end
  end
end
