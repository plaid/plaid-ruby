# frozen_string_literal: true

module Plaid
  module BeaconReport
    module Types
      class BeaconReportCreateRequest < Internal::Types::Model
        field :beacon_user_id, -> { String }, optional: false, nullable: false

        field :type, -> { Plaid::Types::BeaconReportCreateType }, optional: false, nullable: false

        field :fraud_date, -> { String }, optional: false, nullable: false

        field :fraud_amount, -> { Plaid::Types::FraudAmount }, optional: true, nullable: true
      end
    end
  end
end
