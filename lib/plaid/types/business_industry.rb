# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Industry classifications for the business.
    class BusinessIndustry < Internal::Types::Model
      field :classification, -> { Plaid::Types::IndustryClassification }, optional: false, nullable: true
    end
  end
end
