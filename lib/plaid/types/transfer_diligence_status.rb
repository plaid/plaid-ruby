# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferDiligenceStatus
      extend Plaid::Internal::Types::Enum

      NOT_SUBMITTED = "not_submitted"
      SUBMITTED = "submitted"
      UNDER_REVIEW = "under_review"
      APPROVED = "approved"
      DENIED = "denied"
      MORE_INFORMATION_REQUIRED = "more_information_required"
    end
  end
end
