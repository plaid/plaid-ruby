# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying how the `phone` field matched.
    class KycCheckPhoneSummary < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false

      field :area_code, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false
    end
  end
end
