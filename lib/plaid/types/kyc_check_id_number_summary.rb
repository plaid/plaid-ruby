# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying how the `id_number` field matched.
    class KycCheckIDNumberSummary < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false

      field :ssa_verification, -> { Plaid::Types::KycCheckSsaAnalysis }, optional: false, nullable: true
    end
  end
end
