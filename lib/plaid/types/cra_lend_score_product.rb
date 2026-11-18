# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Names the LendScore product at a given version, with options for selecting variants.
    class CraLendScoreProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportGetLendScoreOptions }, optional: true, nullable: true
    end
  end
end
