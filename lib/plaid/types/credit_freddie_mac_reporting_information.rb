# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about a report identifier and a report name.
    class CreditFreddieMacReportingInformation < Internal::Types::Model
      field :report_date_time, -> { String }, optional: true, nullable: false, api_name: "ReportDateTime"

      field :report_identifier_type, -> { String }, optional: true, nullable: false, api_name: "ReportIdentifierType"

      field :reporting_information_parent_identifier, -> { String }, optional: true, nullable: false, api_name: "ReportingInformationParentIdentifier"

      field :reporting_information_identifier, -> { String }, optional: false, nullable: false, api_name: "ReportingInformationIdentifier"
    end
  end
end
