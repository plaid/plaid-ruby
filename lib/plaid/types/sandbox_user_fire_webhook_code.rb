# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SandboxUserFireWebhookCode
      extend Plaid::Internal::Types::Enum

      USER_CHECK_REPORT_READY = "USER_CHECK_REPORT_READY"
      USER_CHECK_REPORT_FAILED = "USER_CHECK_REPORT_FAILED"
      CHECK_REPORT_READY = "CHECK_REPORT_READY"
      CHECK_REPORT_FAILED = "CHECK_REPORT_FAILED"
    end
  end
end
