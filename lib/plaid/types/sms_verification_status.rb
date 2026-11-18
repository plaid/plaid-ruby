# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SmsVerificationStatus
      extend Plaid::Internal::Types::Enum

      PENDING = "pending"
      SUCCESS = "success"
      FAILED = "failed"
      CANCELED = "canceled"
    end
  end
end
