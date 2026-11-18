# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AssetReportTransactionType
      extend Plaid::Internal::Types::Enum

      DIGITAL = "digital"
      PLACE = "place"
      SPECIAL = "special"
      UNRESOLVED = "unresolved"
    end
  end
end
