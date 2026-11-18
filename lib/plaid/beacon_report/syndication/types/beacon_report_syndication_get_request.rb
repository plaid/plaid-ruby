# frozen_string_literal: true

module Plaid
  module BeaconReport
    module Syndication
      module Types
        class BeaconReportSyndicationGetRequest < Internal::Types::Model
          field :beacon_report_syndication_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
