# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PartnerEndCustomerStatus
      extend Plaid::Internal::Types::Enum

      UNDER_REVIEW = "UNDER_REVIEW"
      PENDING_ENABLEMENT = "PENDING_ENABLEMENT"
      ACTIVE = "ACTIVE"
      DENIED = "DENIED"
      MORE_INFORMATION_NEEDED = "MORE_INFORMATION_NEEDED"
    end
  end
end
