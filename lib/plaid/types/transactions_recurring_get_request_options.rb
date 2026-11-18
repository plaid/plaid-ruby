# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to be used with the request. If specified, `options` must not be `null`.
    class TransactionsRecurringGetRequestOptions < Internal::Types::Model
      field :include_personal_finance_category, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :personal_finance_category_version, -> { Plaid::Types::PersonalFinanceCategoryVersion }, optional: true, nullable: false
    end
  end
end
