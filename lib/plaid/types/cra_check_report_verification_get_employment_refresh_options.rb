# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Deprecated. This field is no longer accepted for new clients (created on or after 2026-07-01). New clients should
    # specify required products when creating the Consumer Report. Existing integrations may continue to pass
    # `employment_refresh_options`.
    class CraCheckReportVerificationGetEmploymentRefreshOptions < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: false, nullable: false
    end
  end
end
