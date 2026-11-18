# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The UltraFICO scores generated for the user. `null` when the product failed to generate.
    class CraReportGetUltraFico < Internal::Types::Model
      field :lender_application_id, -> { String }, optional: false, nullable: false

      field :ultrafico_score_results, -> { Internal::Types::Array[Plaid::Types::CraReportGetUltraFicoScoreResult] }, optional: false, nullable: false

      field :report_characteristics, -> { Plaid::Types::CraReportGetUltraFicoReportCharacteristics }, optional: false, nullable: true
    end
  end
end
