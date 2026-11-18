# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxPartyRegistry
      extend Plaid::Internal::Types::Enum

      FDX = "FDX"
      GLEIF = "GLEIF"
      ICANN = "ICANN"
      PRIVATE = "PRIVATE"
    end
  end
end
