# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxPartyType
      extend Plaid::Internal::Types::Enum

      DATA_ACCESS_PLATFORM = "DATA_ACCESS_PLATFORM"
      DATA_PROVIDER = "DATA_PROVIDER"
      DATA_RECIPIENT = "DATA_RECIPIENT"
      INDIVIDUAL = "INDIVIDUAL"
      MERCHANT = "MERCHANT"
      VENDOR = "VENDOR"
    end
  end
end
