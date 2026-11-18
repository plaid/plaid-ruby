# frozen_string_literal: true

module Plaid
  module BeaconReport
    module Types
      class BeaconReportListRequest < Internal::Types::Model
        field :beacon_user_id, -> { String }, optional: false, nullable: false

        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
