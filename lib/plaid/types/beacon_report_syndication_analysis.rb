# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analysis of which fields matched between the originally reported Beacon User and the Beacon User that the report
    # was syndicated to.
    class BeaconReportSyndicationAnalysis < Internal::Types::Model
      field :address, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :date_of_birth, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :email_address, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :name, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :id_number, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :ip_address, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :phone_number, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :depository_accounts, -> { Internal::Types::Array[Plaid::Types::BeaconSyndicatedReportDepositoryAccountMatchAnalysis] }, optional: false, nullable: false
    end
  end
end
