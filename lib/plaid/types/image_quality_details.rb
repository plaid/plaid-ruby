# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the image quality of the document.
    class ImageQualityDetails < Internal::Types::Model
      field :glare_check, -> { Plaid::Types::ImageQualityOutcome }, optional: false, nullable: false

      field :dimensions_check, -> { Plaid::Types::ImageQualityOutcome }, optional: false, nullable: false

      field :blur_check, -> { Plaid::Types::ImageQualityOutcome }, optional: false, nullable: false
    end
  end
end
