# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to be used with the request.
    class TransactionsEnrichRequestOptions < Internal::Types::Model
      field :include_legacy_category, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :personal_finance_category_version, -> { Plaid::Types::PersonalFinanceCategoryVersion }, optional: true, nullable: false
    end
  end
end
