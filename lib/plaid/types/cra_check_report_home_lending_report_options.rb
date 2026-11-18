# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Options for configuring Home Lending Report (Verification Report) generation.
    class CraCheckReportHomeLendingReportOptions < Internal::Types::Model
      field :reports_requested, -> { Internal::Types::Array[Plaid::Types::CraCheckReportVerificationGetReportType] }, optional: false, nullable: false

      field :employment_refresh_options, -> { Plaid::Types::CraCheckReportCreateEmploymentRefreshOptions }, optional: true, nullable: true
    end
  end
end
