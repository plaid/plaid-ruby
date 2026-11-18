# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analyzed name information for the associated hit
    class ScreeningHitNamesItems < Internal::Types::Model
      field :analysis, -> { Plaid::Types::MatchSummary }, optional: true, nullable: false

      field :data, -> { Plaid::Types::IndividualScreeningHitNames }, optional: true, nullable: false
    end
  end
end
