# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WatchlistScreeningHitStatus
      extend Plaid::Internal::Types::Enum

      CONFIRMED = "confirmed"
      PENDING_REVIEW = "pending_review"
      DISMISSED = "dismissed"
    end
  end
end
