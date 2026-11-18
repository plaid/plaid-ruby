# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module ConsentEventCode
      extend Plaid::Internal::Types::Enum

      USER_AGREEMENT = "USER_AGREEMENT"
      USE_CASES = "USE_CASES"
      DATA_SCOPES = "DATA_SCOPES"
      ACCOUNT_SCOPES = "ACCOUNT_SCOPES"
      REVOCATION = "REVOCATION"
    end
  end
end
