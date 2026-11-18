# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an income source
    class MonitoringIncomeSource < Internal::Types::Model
      field :income_source_id, -> { String }, optional: false, nullable: false

      field :income_description, -> { String }, optional: false, nullable: false

      field :income_category, -> { Plaid::Types::CreditBankIncomeCategory }, optional: false, nullable: false

      field :last_transaction_date, -> { String }, optional: false, nullable: false
    end
  end
end
