# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module IncomeVerificationDocParsingConfig
      extend Plaid::Internal::Types::Enum

      OCR = "ocr"
      RISK_SIGNALS = "risk_signals"
    end
  end
end
