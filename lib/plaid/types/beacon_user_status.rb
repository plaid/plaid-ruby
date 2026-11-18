# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BeaconUserStatus
      extend Plaid::Internal::Types::Enum

      REJECTED = "rejected"
      PENDING_REVIEW = "pending_review"
      CLEARED = "cleared"
    end
  end
end
