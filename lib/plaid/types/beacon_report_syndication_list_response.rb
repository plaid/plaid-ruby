# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The response schema for `/beacon/report_syndication/list`
    class BeaconReportSyndicationListResponse < Internal::Types::Model
      field :beacon_report_syndications, -> { Internal::Types::Array[Plaid::Types::BeaconReportSyndication] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
