# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The transaction data for an income stream.
    class CraIncomeTransaction < Internal::Types::Model
      field :transaction_id, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :date, -> { String }, optional: false, nullable: false

      field :original_description, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :outlier, -> { Plaid::Types::CraIncomeTransactionOutlier }, optional: false, nullable: false
    end
  end
end
