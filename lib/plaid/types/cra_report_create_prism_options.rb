# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Selects which Prism products to evaluate and at which version. A product whose version is omitted is not
    # evaluated, so at least one version must be set.
    class CraReportCreatePrismOptions < Internal::Types::Model
      field :cashscore, -> { Plaid::Types::CraReportCreatePrismCashScoreVersion }, optional: true, nullable: true

      field :insights, -> { Plaid::Types::CraReportCreatePrismInsightsVersion }, optional: true, nullable: true

      field :detect, -> { Plaid::Types::CraReportCreatePrismDetectVersion }, optional: true, nullable: true

      field :extend_, -> { Plaid::Types::CraReportCreatePrismExtendVersion }, optional: true, nullable: true, api_name: "extend"
    end
  end
end
