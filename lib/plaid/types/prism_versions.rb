# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The versions of Prism products to evaluate
    class PrismVersions < Internal::Types::Model
      field :firstdetect, -> { Plaid::Types::PrismFirstDetectVersion }, optional: true, nullable: true

      field :detect, -> { Plaid::Types::PrismDetectVersion }, optional: true, nullable: true

      field :cashscore, -> { Plaid::Types::PrismCashScoreVersion }, optional: true, nullable: true

      field :extend_, -> { Plaid::Types::PrismExtendVersion }, optional: true, nullable: true, api_name: "extend"

      field :insights, -> { Plaid::Types::PrismInsightsVersion }, optional: true, nullable: true
    end
  end
end
