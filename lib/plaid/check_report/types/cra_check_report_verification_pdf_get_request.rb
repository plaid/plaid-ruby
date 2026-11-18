# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportVerificationPdfGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :third_party_user_token, -> { String }, optional: true, nullable: false

        field :report_requested, -> { Plaid::CheckReport::Types::CraCheckReportVerificationPdfGetRequestReportRequested }, optional: true, nullable: false

        field :reports_requested, -> { Internal::Types::Array[Plaid::Types::CraCheckReportVerificationPdfReportType] }, optional: true, nullable: false

        field :hide_gse_details, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
