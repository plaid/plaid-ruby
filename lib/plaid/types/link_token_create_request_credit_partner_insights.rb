# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Credit Partner Insights product.
    class LinkTokenCreateRequestCreditPartnerInsights < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: true, nullable: false
    end
  end
end
