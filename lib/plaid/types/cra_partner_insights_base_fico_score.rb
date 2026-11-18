# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the base FICO score associated with an UltraFICO® scoring request.
    class CraPartnerInsightsBaseFicoScore < Internal::Types::Model
      field :bureau, -> { Plaid::Types::CraPartnerInsightsBureau }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: false

      field :reason_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :reason_code1, -> { String }, optional: true, nullable: true, api_name: "reason_code_1"

      field :reason_code2, -> { String }, optional: true, nullable: true, api_name: "reason_code_2"

      field :reason_code3, -> { String }, optional: true, nullable: true, api_name: "reason_code_3"

      field :reason_code4, -> { String }, optional: true, nullable: true, api_name: "reason_code_4"

      field :did_inquiries_adversely_affect_score, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :base_fico_score_version, -> { Plaid::Types::CraPartnerInsightsBaseFicoScoreVersion }, optional: false, nullable: false
    end
  end
end
