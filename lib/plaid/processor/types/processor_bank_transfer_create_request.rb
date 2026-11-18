# frozen_string_literal: true

module Plaid
  module Processor
    module Types
      class ProcessorBankTransferCreateRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false

        field :processor_token, -> { String }, optional: false, nullable: false

        field :type, -> { Plaid::Types::BankTransferType }, optional: false, nullable: false

        field :network, -> { Plaid::Types::BankTransferNetwork }, optional: false, nullable: false

        field :amount, -> { String }, optional: false, nullable: false

        field :iso_currency_code, -> { String }, optional: false, nullable: false

        field :description, -> { String }, optional: false, nullable: false

        field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

        field :user, -> { Plaid::Types::BankTransferUser }, optional: false, nullable: false

        field :custom_tag, -> { String }, optional: true, nullable: true

        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: true

        field :origination_account_id, -> { String }, optional: true, nullable: true
      end
    end
  end
end
