# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AccountSelectionCardinality
      extend Plaid::Internal::Types::Enum

      SINGLE_SELECT = "SINGLE_SELECT"
      MULTI_SELECT = "MULTI_SELECT"
      ALL = "ALL"
    end
  end
end
