# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration for the FICO products used in the Partner Insights product.
    class CraPartnerInsightsFicoInput < Internal::Types::Model
      field :fico_lender_id, -> { String }, optional: false, nullable: false

      field :lender_application_id, -> { String }, optional: false, nullable: false

      field :ultrafico_score_requests, -> { Internal::Types::Array[Plaid::Types::CraPartnerInsightsUltraFicoScoreRequest] }, optional: false, nullable: false
    end
  end
end
