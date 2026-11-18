# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # TransactionsRecurringGetResponse defines the response schema for `/transactions/recurring/get`
    class TransactionsRecurringGetResponse < Internal::Types::Model
      field :inflow_streams, -> { Internal::Types::Array[Plaid::Types::TransactionStream] }, optional: false, nullable: false

      field :outflow_streams, -> { Internal::Types::Array[Plaid::Types::TransactionStream] }, optional: false, nullable: false

      field :updated_datetime, -> { String }, optional: false, nullable: false

      field :personal_finance_category_version, -> { Plaid::Types::PersonalFinanceCategoryVersion }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
