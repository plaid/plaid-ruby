# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A subset of information from a Beacon Report that has been syndicated to a matching Beacon User in your program.
    #
    # The `id` field in the response is the ID of the original report that was syndicated. If the original report was
    # created by your organization, the field will be filled with the ID of the report. Otherwise, the field will be
    # `null` indicating that the original report was created by another Beacon customer.
    class BeaconReportSyndicationOriginalReport < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::BeaconReportType }, optional: false, nullable: false

      field :fraud_date, -> { String }, optional: false, nullable: true

      field :event_date, -> { String }, optional: false, nullable: false
    end
  end
end
