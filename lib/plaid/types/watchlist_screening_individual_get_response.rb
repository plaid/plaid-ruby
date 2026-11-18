# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The screening object allows you to represent a customer in your system, update their profile, and search for them
    # on various watchlists. Note: Rejected customers will not receive new hits, regardless of program configuration.
    class WatchlistScreeningIndividualGetResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :search_terms, -> { Plaid::Types::WatchlistScreeningSearchTerms }, optional: false, nullable: false

      field :assignee, -> { String }, optional: false, nullable: true

      field :status, -> { Plaid::Types::WatchlistScreeningStatus }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: true

      field :audit_trail, -> { Plaid::Types::WatchlistScreeningAuditTrail }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
