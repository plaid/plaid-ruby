# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a credit card account.
    class CreditCardLiability < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: true

      field :aprs, -> { Internal::Types::Array[Plaid::Types::Apr] }, optional: false, nullable: false

      field :is_overdue, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :last_payment_amount, -> { Float }, optional: false, nullable: true

      field :last_payment_date, -> { String }, optional: false, nullable: true

      field :last_statement_issue_date, -> { String }, optional: false, nullable: true

      field :last_statement_balance, -> { Float }, optional: false, nullable: true

      field :minimum_payment_amount, -> { Float }, optional: false, nullable: true

      field :next_payment_due_date, -> { String }, optional: false, nullable: true

      field :cash_advance_limit, -> { Float }, optional: true, nullable: true
    end
  end
end
