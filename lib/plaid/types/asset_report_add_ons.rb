# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AssetReportAddOns
      extend Plaid::Internal::Types::Enum

      INVESTMENTS = "investments"
      FAST_ASSETS = "fast_assets"
    end
  end
end
