# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AssetHoldingAssetHoldingType
      extend Plaid::Internal::Types::Enum

      BOND = "Bond"
      STOCK = "Stock"
      CRYPTO = "Crypto"
      OTHER = "Other"
    end
  end
end
