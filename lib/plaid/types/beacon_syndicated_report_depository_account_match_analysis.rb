# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analysis of whether this account matched between the originally reported Beacon User and the Beacon User that the
    # report syndicated to.
    class BeaconSyndicatedReportDepositoryAccountMatchAnalysis < Internal::Types::Model
      field :account_mask, -> { String }, optional: false, nullable: false

      field :routing_number, -> { String }, optional: false, nullable: false

      field :match_status, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false
    end
  end
end
