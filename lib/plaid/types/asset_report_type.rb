# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AssetReportType
      extend Plaid::Internal::Types::Enum

      FULL = "FULL"
      FAST = "FAST"
    end
  end
end
