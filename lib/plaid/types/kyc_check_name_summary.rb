# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying how the `name` field matched.
    class KycCheckNameSummary < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false

      field :given_name, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false

      field :family_name, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false
    end
  end
end
