# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BeaconReportType
      extend Plaid::Internal::Types::Enum

      FIRST_PARTY = "first_party"
      STOLEN = "stolen"
      SYNTHETIC = "synthetic"
      ACCOUNT_TAKEOVER = "account_takeover"
      DATA_BREACH = "data_breach"
      UNKNOWN = "unknown"
    end
  end
end
