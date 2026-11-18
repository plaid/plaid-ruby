# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed date of birth for the associated hit
    class ScreeningHitDateOfBirthItem < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::DateRange }, optional: true, nullable: false
    end
  end
end
