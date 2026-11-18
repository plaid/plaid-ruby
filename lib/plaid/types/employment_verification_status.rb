# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module EmploymentVerificationStatus
      extend Plaid::Internal::Types::Enum

      EMPLOYMENT_STATUS_ACTIVE = "EMPLOYMENT_STATUS_ACTIVE"
      EMPLOYMENT_STATUS_INACTIVE = "EMPLOYMENT_STATUS_INACTIVE"
    end
  end
end
