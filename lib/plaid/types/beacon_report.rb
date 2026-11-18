# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Beacon Report describes the type of fraud committed by a user as well as the date the fraud was committed and
    # the total amount of money lost due to the fraud incident.
    #
    # This information is used to block similar fraud attempts on your platform as well as alert other companies who
    # screen a user with matching identity information.
    # Other companies will not receive any new identity information, just what matched, plus information such as
    # industry, type of fraud, and date of fraud.
    #
    # You can manage your fraud reports by adding, deleting, or editing reports as you get additional information on
    # fraudulent users.
    class BeaconReport < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :beacon_user_id, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::BeaconReportType }, optional: false, nullable: false

      field :fraud_date, -> { String }, optional: false, nullable: true

      field :event_date, -> { String }, optional: false, nullable: false

      field :fraud_amount, -> { Plaid::Types::FraudAmount }, optional: false, nullable: true

      field :audit_trail, -> { Plaid::Types::BeaconAuditTrail }, optional: false, nullable: false
    end
  end
end
