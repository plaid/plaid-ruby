# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ItemCreateAuthentication
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      DATA_PARTNER = "DATA_PARTNER"
      PLAID = "PLAID"
    end
  end
end
