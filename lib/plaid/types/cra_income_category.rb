# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The income category for a given stream. The streams returned in the response will be filtered based on these
    # primary and secondary income categories.
    #
    # See the [Income V2 Category Taxonomy](https://plaid.com/documents/income-v2-category-taxonomy.csv) for a full list
    # of income categories.
    class CraIncomeCategory < Internal::Types::Model
      field :primary, -> { String }, optional: false, nullable: false

      field :secondary, -> { String }, optional: false, nullable: false
    end
  end
end
