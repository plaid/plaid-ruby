# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Beacon Report Syndication represents a Beacon Report created either by your organization or another Beacon
    # customer that matches a specific Beacon User you've created.
    #
    # The `analysis` field in the response indicates which fields matched between the originally reported Beacon User
    # and the Beacon User that the report was syndicated to.
    #
    # The `report` field in the response contains a subset of information from the original report.
    class BeaconReportSyndicationGetResponse < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :beacon_user_id, -> { String }, optional: false, nullable: false

      field :report, -> { Plaid::Types::BeaconReportSyndicationOriginalReport }, optional: false, nullable: false

      field :analysis, -> { Plaid::Types::BeaconReportSyndicationAnalysis }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
