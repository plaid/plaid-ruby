# frozen_string_literal: true

module Plaid
  module Transfer
    module Authorization
      module Types
        class TransferAuthorizationCreateRequest < Internal::Types::Model
          field :access_token, -> { String }, optional: false, nullable: false

          field :account_id, -> { String }, optional: false, nullable: false

          field :funding_account_id, -> { String }, optional: true, nullable: true

          field :ledger_id, -> { String }, optional: true, nullable: true

          field :payment_profile_token, -> { String }, optional: true, nullable: false

          field :type, -> { Plaid::Types::TransferType }, optional: false, nullable: false

          field :network, -> { Plaid::Types::TransferNetwork }, optional: false, nullable: false

          field :amount, -> { String }, optional: false, nullable: false

          field :ach_class, -> { Plaid::Types::AchClass }, optional: true, nullable: false

          field :wire_details, -> { Plaid::Types::TransferWireDetails }, optional: true, nullable: true

          field :user, -> { Plaid::Types::TransferAuthorizationUserInRequest }, optional: false, nullable: false

          field :user_id, -> { String }, optional: true, nullable: true

          field :device, -> { Plaid::Types::TransferAuthorizationDevice }, optional: true, nullable: false

          field :origination_account_id, -> { String }, optional: true, nullable: false

          field :iso_currency_code, -> { String }, optional: true, nullable: false

          field :idempotency_key, -> { String }, optional: true, nullable: true

          field :user_present, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :with_guarantee, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :request_guarantee, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :beacon_session_id, -> { String }, optional: true, nullable: true

          field :originator_client_id, -> { String }, optional: true, nullable: true

          field :credit_funds_source, -> { Plaid::Types::TransferCreditFundsSource }, optional: true, nullable: true

          field :test_clock_id, -> { String }, optional: true, nullable: true

          field :ruleset_key, -> { String }, optional: true, nullable: true

          field :custom_attributes, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: true

          field :user_attributes, -> { Plaid::Types::TransferAuthorizationUserAttributes }, optional: true, nullable: true
        end
      end
    end
  end
end
