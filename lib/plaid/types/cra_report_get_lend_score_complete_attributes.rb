# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # LendScore Complete attribute data returned by `/cra/report/get`.
    class CraReportGetLendScoreCompleteAttributes < Internal::Types::Model
      field :lend_scores, -> { Internal::Types::Array[Plaid::Types::CraReportGetLendScoreVariantScore] }, optional: false, nullable: false

      field :cashflow_insights, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :network_insights, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true
    end
  end
end
