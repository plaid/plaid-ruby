# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights into a user's top merchants.
    class MerchantInsights < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :entity_id, -> { String }, optional: true, nullable: true

      field :website, -> { String }, optional: false, nullable: true

      field :transaction_count, -> { Integer }, optional: false, nullable: false

      field :personal_finance_category_primary, -> { String }, optional: false, nullable: true

      field :personal_finance_category_detailed, -> { String }, optional: false, nullable: true

      field :total_outflows, -> { Float }, optional: false, nullable: false

      field :total_inflows, -> { Float }, optional: false, nullable: false
    end
  end
end
