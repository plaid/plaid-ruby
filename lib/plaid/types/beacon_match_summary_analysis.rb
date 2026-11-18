# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analysis of which fields matched between one Beacon User and another.
    class BeaconMatchSummaryAnalysis < Internal::Types::Model
      field :address, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :date_of_birth, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :email_address, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :name, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :id_number, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :ip_address, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false

      field :phone_number, -> { Plaid::Types::BeaconMatchSummaryCode }, optional: false, nullable: false
    end
  end
end
