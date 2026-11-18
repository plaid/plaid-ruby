# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents a transfer intent within Transfer UI.
    class TransferIntentCreate < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :created, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::TransferIntentStatus }, optional: false, nullable: false

      field :account_id, -> { String }, optional: true, nullable: true

      field :origination_account_id, -> { String }, optional: false, nullable: false

      field :funding_account_id, -> { String }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :mode, -> { Plaid::Types::TransferIntentCreateMode }, optional: false, nullable: false

      field :network, -> { Plaid::Types::TransferIntentCreateNetwork }, optional: true, nullable: false

      field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

      field :user, -> { Plaid::Types::TransferUserInResponse }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :require_guarantee, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
