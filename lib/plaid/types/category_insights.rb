# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights on a user's top personal finance categories.
    class CategoryInsights < Internal::Types::Model
      field :primary_category_insights, -> { Internal::Types::Array[Plaid::Types::CategoryInsightDetails] }, optional: true, nullable: false

      field :detailed_category_insights, -> { Internal::Types::Array[Plaid::Types::CategoryInsightDetails] }, optional: true, nullable: false
    end
  end
end
