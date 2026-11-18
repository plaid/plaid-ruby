# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents a bank transfer within the Bank Transfers API.
    class BankTransfer < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :ach_class, -> { Plaid::Types::AchClass }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::BankTransferType }, optional: false, nullable: false

      field :user, -> { Plaid::Types::BankTransferUser }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::BankTransferStatus }, optional: false, nullable: false

      field :network, -> { Plaid::Types::BankTransferNetwork }, optional: false, nullable: false

      field :cancellable, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :failure_reason, -> { Plaid::Types::BankTransferFailure }, optional: false, nullable: true

      field :custom_tag, -> { String }, optional: false, nullable: true

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: true

      field :origination_account_id, -> { String }, optional: false, nullable: true

      field :direction, -> { Plaid::Types::BankTransferDirection }, optional: false, nullable: true
    end
  end
end
