# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about a report identifier and a report name.
    class ReportingInformation < Internal::Types::Model
      field :reporting_information_identifier, -> { String }, optional: false, nullable: false, api_name: "ReportingInformationIdentifier"
    end
  end
end
