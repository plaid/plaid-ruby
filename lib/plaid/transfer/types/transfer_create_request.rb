# frozen_string_literal: true

module Plaid
  module Transfer
    module Types
      class TransferCreateRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: true, nullable: false

        field :access_token, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :authorization_id, -> { String }, optional: false, nullable: false

        field :type, -> { Plaid::Types::TransferType }, optional: true, nullable: false

        field :network, -> { Plaid::Types::TransferNetwork }, optional: true, nullable: false

        field :amount, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: false, nullable: false

        field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

        field :user, -> { Plaid::Types::TransferUserInRequestDeprecated }, optional: true, nullable: true

        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: true

        field :origination_account_id, -> { String }, optional: true, nullable: true

        field :iso_currency_code, -> { String }, optional: true, nullable: false

        field :test_clock_id, -> { String }, optional: true, nullable: true

        field :facilitator_fee, -> { String }, optional: true, nullable: false
      end
    end
  end
end
