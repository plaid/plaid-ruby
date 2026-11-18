# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The response schema for `/beacon/report/list`
    class BeaconReportListResponse < Internal::Types::Model
      field :beacon_reports, -> { Internal::Types::Array[Plaid::Types::BeaconReport] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
