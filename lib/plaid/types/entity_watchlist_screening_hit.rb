# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data from a government watchlist that has been attached to the screening.
    class EntityWatchlistScreeningHit < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :review_status, -> { Plaid::Types::WatchlistScreeningHitStatus }, optional: false, nullable: false

      field :first_active, -> { String }, optional: false, nullable: false

      field :inactive_since, -> { String }, optional: false, nullable: true

      field :historical_since, -> { String }, optional: false, nullable: true

      field :list_code, -> { Plaid::Types::EntityWatchlistCode }, optional: false, nullable: false

      field :plaid_uid, -> { String }, optional: false, nullable: false

      field :source_uid, -> { String }, optional: false, nullable: true

      field :sub_programs, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :analysis, -> { Plaid::Types::EntityScreeningHitAnalysis }, optional: true, nullable: false

      field :data, -> { Plaid::Types::EntityScreeningHitData }, optional: true, nullable: false
    end
  end
end
