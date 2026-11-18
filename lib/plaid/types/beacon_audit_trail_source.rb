# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BeaconAuditTrailSource
      extend Plaid::Internal::Types::Enum

      DASHBOARD = "dashboard"
      API = "api"
      SYSTEM = "system"
      BULK_IMPORT = "bulk_import"
    end
  end
end
