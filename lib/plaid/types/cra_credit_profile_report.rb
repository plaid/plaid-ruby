# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains data for the CRA Credit Profile Report.
    class CraCreditProfileReport < Internal::Types::Model
      field :date_retrieved, -> { String }, optional: false, nullable: false

      field :inquiry_type, -> { Plaid::Types::CraCreditProfileInquiryType }, optional: false, nullable: false

      field :client_report_id, -> { String }, optional: false, nullable: false

      field :lend_scores, -> { Internal::Types::Array[Plaid::Types::CraCreditProfileLendScore] }, optional: false, nullable: false

      field :cashflow_insights_attributes, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :network_insights_attributes, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true

      field :metadata, -> { Plaid::Types::CraCreditProfileReportMetadata }, optional: false, nullable: true
    end
  end
end
