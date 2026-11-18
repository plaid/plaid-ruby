# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PartnerEndCustomerOAuthInstitutionApplicationStatus
      extend Plaid::Internal::Types::Enum

      NOT_STARTED = "NOT_STARTED"
      PROCESSING = "PROCESSING"
      APPROVED = "APPROVED"
      ENABLED = "ENABLED"
      ATTENTION_REQUIRED = "ATTENTION_REQUIRED"
    end
  end
end
