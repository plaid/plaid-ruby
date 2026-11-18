# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The entity screening object allows you to represent an entity in your system, update its profile, and search for
    # it on various watchlists. Note: Rejected entity screenings will not receive new hits, regardless of entity program
    # configuration.
    class WatchlistScreeningEntityUpdateResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :search_terms, -> { Plaid::Types::EntityWatchlistScreeningSearchTerms }, optional: false, nullable: false

      field :assignee, -> { String }, optional: false, nullable: true

      field :status, -> { Plaid::Types::WatchlistScreeningStatus }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: true

      field :audit_trail, -> { Plaid::Types::WatchlistScreeningAuditTrail }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
