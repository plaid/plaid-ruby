# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The optional checks requested for this business verification.
    class BusinessVerificationRequestedChecks < Internal::Types::Model
      field :include_website_analysis, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :include_industry_classification, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
