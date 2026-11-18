# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Names the LendScore Complete product bundle at a given version, with options for selecting LendScore variants.
    class CraLendScoreCompleteBundleProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :options, -> { Plaid::Types::CraReportGetLendScoreCompleteOptions }, optional: true, nullable: true
    end
  end
end
