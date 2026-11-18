# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configures the UltraFICO scores to generate.
    class CraReportCreateUltraFicoOptions < Internal::Types::Model
      field :fico_lender_id, -> { String }, optional: false, nullable: false

      field :lender_application_id, -> { String }, optional: false, nullable: false

      field :ultrafico_score_requests, -> { Internal::Types::Array[Plaid::Types::CraReportCreateUltraFicoScoreRequest] }, optional: false, nullable: false
    end
  end
end
