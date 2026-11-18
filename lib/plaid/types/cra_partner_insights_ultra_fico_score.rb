# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The calculated UltraFICO® score.
    class CraPartnerInsightsUltraFicoScore < Internal::Types::Model
      field :ultrafico_score_version, -> { Plaid::Types::CraPartnerInsightsUltraFicoScoreVersion }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: false

      field :negative_reason_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :positive_reason_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :reason_code1, -> { String }, optional: true, nullable: true, api_name: "reason_code_1"

      field :reason_code2, -> { String }, optional: true, nullable: true, api_name: "reason_code_2"

      field :reason_code3, -> { String }, optional: true, nullable: true, api_name: "reason_code_3"

      field :reason_code4, -> { String }, optional: true, nullable: true, api_name: "reason_code_4"

      field :positive_reason_code1, -> { String }, optional: true, nullable: true, api_name: "positive_reason_code_1"

      field :positive_reason_code2, -> { String }, optional: true, nullable: true, api_name: "positive_reason_code_2"

      field :positive_reason_code3, -> { String }, optional: true, nullable: true, api_name: "positive_reason_code_3"

      field :positive_reason_code4, -> { String }, optional: true, nullable: true, api_name: "positive_reason_code_4"

      field :did_inquiries_adversely_affect_score, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
