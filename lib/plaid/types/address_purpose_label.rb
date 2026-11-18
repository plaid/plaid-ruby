# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module AddressPurposeLabel
      extend Plaid::Internal::Types::Enum

      RESIDENTIAL = "residential"
      COMMERCIAL = "commercial"
      NO_DATA = "no_data"
    end
  end
end
