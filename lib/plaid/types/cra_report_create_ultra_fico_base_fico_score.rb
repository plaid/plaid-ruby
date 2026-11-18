# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The base FICO score used for an UltraFICO scoring request.
    class CraReportCreateUltraFicoBaseFicoScore < Internal::Types::Model
      field :bureau, -> { Plaid::Types::CraUltraFicoBureau }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: false

      field :reason_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :did_inquiries_adversely_affect_score, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :base_fico_score_version, -> { Plaid::Types::CraUltraFicoBaseFicoScoreVersion }, optional: false, nullable: false
    end
  end
end
