# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A calculated UltraFICO score. `null` when the individual scoring request did not produce a score.
    class CraReportGetUltraFicoScore < Internal::Types::Model
      field :ultrafico_score_version, -> { Plaid::Types::CraUltraFicoScoreVersion }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: false

      field :negative_reason_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :positive_reason_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :did_inquiries_adversely_affect_score, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
