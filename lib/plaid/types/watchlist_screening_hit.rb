# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data from a government watchlist or PEP list that has been attached to the screening.
    class WatchlistScreeningHit < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :review_status, -> { Plaid::Types::WatchlistScreeningHitStatus }, optional: false, nullable: false

      field :first_active, -> { String }, optional: false, nullable: false

      field :inactive_since, -> { String }, optional: false, nullable: true

      field :historical_since, -> { String }, optional: false, nullable: true

      field :list_code, -> { Plaid::Types::IndividualWatchlistCode }, optional: false, nullable: false

      field :plaid_uid, -> { String }, optional: false, nullable: false

      field :source_uid, -> { String }, optional: false, nullable: true

      field :sub_programs, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :analysis, -> { Plaid::Types::ScreeningHitAnalysis }, optional: true, nullable: false

      field :data, -> { Plaid::Types::ScreeningHitData }, optional: true, nullable: false
    end
  end
end
