# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object with information about the status of the Item.
    class ItemStatusNullable < Internal::Types::Model
      field :investments, -> { Plaid::Types::ItemStatusInvestments }, optional: true, nullable: true

      field :transactions, -> { Plaid::Types::ItemStatusTransactions }, optional: true, nullable: true

      field :last_webhook, -> { Plaid::Types::ItemStatusLastWebhook }, optional: false, nullable: true
    end
  end
end
