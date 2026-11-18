# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module FdxContentTypes
      extend Plaid::Internal::Types::Enum

      APPLICATION_PDF = "application/pdf"
      IMAGE_GIF = "image/gif"
      IMAGE_JPEG = "image/jpeg"
      IMAGE_TIFF = "image/tiff"
      IMAGE_PNG = "image/png"
      APPLICATION_JSON = "application/json"
    end
  end
end
