# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Beacon Duplicate represents a pair of matching Beacon Users and an analysis of the fields they matched on.
    class BeaconDuplicateGetResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :beacon_user1, -> { Plaid::Types::BeaconUserRevision }, optional: false, nullable: false

      field :beacon_user2, -> { Plaid::Types::BeaconUserRevision }, optional: false, nullable: false

      field :analysis, -> { Plaid::Types::BeaconMatchSummaryAnalysis }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
