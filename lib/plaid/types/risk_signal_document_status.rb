# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RiskSignalDocumentStatus
      extend Plaid::Internal::Types::Enum

      PROCESSING = "PROCESSING"
      PROCESSING_COMPLETE = "PROCESSING_COMPLETE"
      PROCESSING_ERROR = "PROCESSING_ERROR"
      PASSWORD_PROTECTED = "PASSWORD_PROTECTED"
      VIRUS_DETECTED = "VIRUS_DETECTED"
    end
  end
end
