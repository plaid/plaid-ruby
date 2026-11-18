# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module NetworkStatusGetResponseNetworkStatus
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      RETURNING_USER = "RETURNING_USER"
    end
  end
end
