# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module RiskSignalFileType
      extend Plaid::Internal::Types::Enum

      UNKNOWN = "UNKNOWN"
      IMAGE_PDF = "IMAGE_PDF"
      SCAN_OCR = "SCAN_OCR"
      TRUE_PDF = "TRUE_PDF"
      IMAGE = "IMAGE"
      MIXED_PAGE_PDF = "MIXED_PAGE_PDF"
      EMPTY_PDF = "EMPTY_PDF"
      FLATTENED_PDF = "FLATTENED_PDF"
    end
  end
end
