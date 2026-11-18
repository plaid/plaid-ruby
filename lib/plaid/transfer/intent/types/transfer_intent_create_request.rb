# frozen_string_literal: true

module Plaid
  module Transfer
    module Intent
      module Types
        class TransferIntentCreateRequest < Internal::Types::Model
          field :account_id, -> { String }, optional: true, nullable: true

          field :funding_account_id, -> { String }, optional: true, nullable: true

          field :mode, -> { Plaid::Types::TransferIntentCreateMode }, optional: false, nullable: false

          field :network, -> { Plaid::Types::TransferIntentCreateNetwork }, optional: true, nullable: false

          field :amount, -> { String }, optional: false, nullable: false

          field :description, -> { String }, optional: false, nullable: false

          field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

          field :origination_account_id, -> { String }, optional: true, nullable: true

          field :user, -> { Plaid::Types::TransferUserInRequest }, optional: false, nullable: false

          field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: true

          field :iso_currency_code, -> { String }, optional: true, nullable: false

          field :require_guarantee, -> { Internal::Types::Boolean }, optional: true, nullable: true
        end
      end
    end
  end
end
