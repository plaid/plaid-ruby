# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Summary object reflecting the match result of the associated data
    class MatchSummary < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false
    end
  end
end
