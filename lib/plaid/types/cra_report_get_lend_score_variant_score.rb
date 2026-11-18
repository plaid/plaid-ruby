# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An individual LendScore variant result returned by `/cra/report/get`.
    class CraReportGetLendScoreVariantScore < Internal::Types::Model
      field :variant, -> { Plaid::Types::CraLendScoreVariant }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: true

      field :reason_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :error_code, -> { String }, optional: false, nullable: true
    end
  end
end
