# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PartnerEndCustomerOAuthStatusUpdatedValues
      extend Plaid::Internal::Types::Enum

      NOT_STARTED = "not-started"
      PROCESSING = "processing"
      APPROVED = "approved"
      ENABLED = "enabled"
      ATTENTION_REQUIRED = "attention-required"
    end
  end
end
