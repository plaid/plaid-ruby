# frozen_string_literal: true

module Plaid
  module Transfer
    module Recurring
      module Types
        class TransferRecurringCreateRequest < Internal::Types::Model
          field :access_token, -> { String }, optional: false, nullable: false

          field :idempotency_key, -> { String }, optional: false, nullable: false

          field :account_id, -> { String }, optional: false, nullable: false

          field :funding_account_id, -> { String }, optional: true, nullable: true

          field :type, -> { Plaid::Types::TransferType }, optional: false, nullable: false

          field :network, -> { Plaid::Types::TransferRecurringNetwork }, optional: false, nullable: false

          field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

          field :amount, -> { String }, optional: false, nullable: false

          field :user_present, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :iso_currency_code, -> { String }, optional: true, nullable: false

          field :description, -> { String }, optional: false, nullable: false

          field :test_clock_id, -> { String }, optional: true, nullable: true

          field :schedule, -> { Plaid::Types::TransferRecurringSchedule }, optional: false, nullable: false

          field :user, -> { Plaid::Types::TransferUserInRequest }, optional: false, nullable: false

          field :device, -> { Plaid::Types::TransferDevice }, optional: true, nullable: false
        end
      end
    end
  end
end
