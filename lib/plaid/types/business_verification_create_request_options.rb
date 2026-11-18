# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Optional checks to run for this verification. Omit or set to null to run Business Search only.
    class BusinessVerificationCreateRequestOptions < Internal::Types::Model
      field :include_website_analysis, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :include_industry_classification, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
