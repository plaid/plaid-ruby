# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Summary of how a specific business field matched against data provider results
    class BusinessFieldMatchSummary < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false
    end
  end
end
