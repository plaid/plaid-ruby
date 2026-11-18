# frozen_string_literal: true

module Plaid
  module BeaconReport
    module Types
      class BeaconReportGetRequest < Internal::Types::Model
        field :beacon_report_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
