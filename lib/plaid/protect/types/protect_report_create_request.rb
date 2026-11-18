# frozen_string_literal: true

module Plaid
  module Protect
    module Types
      class ProtectReportCreateRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: true

        field :client_user_id, -> { String }, optional: true, nullable: true

        field :incident_event, -> { Plaid::Types::ProtectIncidentEvent }, optional: true, nullable: true

        field :report_confidence, -> { Plaid::Types::ProtectReportConfidence }, optional: false, nullable: false

        field :report_type, -> { Plaid::Types::ProtectReportType }, optional: false, nullable: false

        field :report_source, -> { Plaid::Types::ProtectReportSource }, optional: false, nullable: false

        field :bank_account, -> { Plaid::Types::ProtectBankAccount }, optional: true, nullable: true

        field :ach_return_code, -> { String }, optional: true, nullable: true

        field :notes, -> { String }, optional: true, nullable: true
      end
    end
  end
end
