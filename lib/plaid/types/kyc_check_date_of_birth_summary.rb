# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Result summary object specifying how the `date_of_birth` field matched.
    class KycCheckDateOfBirthSummary < Internal::Types::Model
      field :summary, -> { Plaid::Types::MatchSummaryCode }, optional: false, nullable: false

      field :day, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false

      field :month, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false

      field :year, -> { Plaid::Types::HiddenMatchSummaryCode }, optional: true, nullable: false
    end
  end
end
