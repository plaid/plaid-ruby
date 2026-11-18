# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A Protect report associated with a user. Contains details about documented incidents, which may include fraud,
    # investigation outcomes, or other risk events.
    class ProtectReport < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: false

      field :incident_event, -> { Plaid::Types::ProtectIncidentEventResponse }, optional: false, nullable: true

      field :report_confidence, -> { Plaid::Types::ProtectReportConfidence }, optional: false, nullable: false

      field :report_type, -> { Plaid::Types::ProtectReportType }, optional: false, nullable: false

      field :report_source, -> { Plaid::Types::ProtectReportSource }, optional: false, nullable: false

      field :bank_account, -> { Plaid::Types::ProtectBankAccount }, optional: false, nullable: true

      field :ach_return_code, -> { String }, optional: false, nullable: true

      field :notes, -> { String }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false
    end
  end
end
