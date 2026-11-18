# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents a recurring transfer within the Transfers API.
    class RecurringTransferNullable < Internal::Types::Model
      field :recurring_transfer_id, -> { String }, optional: false, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :next_origination_date, -> { String }, optional: false, nullable: true

      field :test_clock_id, -> { String }, optional: true, nullable: true

      field :type, -> { Plaid::Types::TransferType }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::TransferRecurringStatus }, optional: false, nullable: false

      field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

      field :network, -> { Plaid::Types::TransferRecurringNetwork }, optional: false, nullable: false

      field :origination_account_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :funding_account_id, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :transfer_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :user, -> { Plaid::Types::TransferUserInResponse }, optional: false, nullable: false

      field :schedule, -> { Plaid::Types::TransferRecurringSchedule }, optional: false, nullable: false
    end
  end
end
