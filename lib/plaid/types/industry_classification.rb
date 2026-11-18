# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A predicted NAICS industry classification. Null when classification was not requested or no prediction is
    # available.
    class IndustryClassification < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :confidence, -> { Plaid::Types::BusinessIndustryConfidence }, optional: false, nullable: true

      field :mcc_codes, -> { Internal::Types::Array[Plaid::Types::BusinessMerchantCategoryCode] }, optional: false, nullable: false

      field :sic_codes, -> { Internal::Types::Array[Plaid::Types::BusinessStandardIndustrialClassificationCode] }, optional: false, nullable: false
    end
  end
end
