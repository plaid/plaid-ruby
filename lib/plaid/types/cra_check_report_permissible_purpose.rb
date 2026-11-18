# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraCheckReportPermissiblePurpose
      extend Plaid::Internal::Types::Enum

      ACCOUNT_REVIEW_CREDIT = "ACCOUNT_REVIEW_CREDIT"
      ACCOUNT_REVIEW_NON_CREDIT = "ACCOUNT_REVIEW_NON_CREDIT"
      WRITTEN_INSTRUCTION_OTHER = "WRITTEN_INSTRUCTION_OTHER"
      SECONDARY_INVESTOR = "SECONDARY_INVESTOR"
    end
  end
end
