# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportVerificationGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :reports_requested, -> { Internal::Types::Array[Plaid::Types::CraCheckReportVerificationGetReportType] }, optional: false, nullable: false

        field :employment_refresh_options, -> { Plaid::Types::CraCheckReportVerificationGetEmploymentRefreshOptions }, optional: true, nullable: true

        field :user_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
