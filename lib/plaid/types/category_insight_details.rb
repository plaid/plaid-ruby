# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights object for categories.
    class CategoryInsightDetails < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :transaction_count, -> { Integer }, optional: false, nullable: false

      field :total_outflows, -> { Float }, optional: false, nullable: false

      field :total_inflows, -> { Float }, optional: false, nullable: false

      field :top_counterparties, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
