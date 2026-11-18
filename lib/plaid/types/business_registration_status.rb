# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessRegistrationStatus
      extend Plaid::Internal::Types::Enum

      ACTIVE = "active"
      INACTIVE = "inactive"
      UNKNOWN = "unknown"
    end
  end
end
