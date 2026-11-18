# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A review submitted by a team member for an individual watchlist screening. A review can be either a comment on the
    # current screening state, actions taken
    # against hits attached to the watchlist screening, or both.
    class WatchlistScreeningReview < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :confirmed_hits, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :dismissed_hits, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :comment, -> { String }, optional: false, nullable: true

      field :audit_trail, -> { Plaid::Types::WatchlistScreeningAuditTrail }, optional: false, nullable: false
    end
  end
end
