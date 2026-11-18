# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Prism Data insights for the user.
    class CraPartnerInsightsPrism < Internal::Types::Model
      field :insights, -> { Plaid::Types::PrismInsights }, optional: true, nullable: true

      field :cash_score, -> { Plaid::Types::PrismCashScore }, optional: true, nullable: true

      field :extend_, -> { Plaid::Types::PrismExtend }, optional: true, nullable: true, api_name: "extend"

      field :first_detect, -> { Plaid::Types::PrismFirstDetect }, optional: true, nullable: true

      field :detect, -> { Plaid::Types::PrismDetect }, optional: true, nullable: true

      field :status, -> { String }, optional: false, nullable: false
    end
  end
end
