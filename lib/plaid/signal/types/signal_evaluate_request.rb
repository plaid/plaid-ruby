# frozen_string_literal: true

module Plaid
  module Signal
    module Types
      class SignalEvaluateRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :client_transaction_id, -> { String }, optional: false, nullable: false

        field :amount, -> { Float }, optional: false, nullable: false

        field :user_present, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :client_user_id, -> { String }, optional: true, nullable: false

        field :is_recurring, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :default_payment_method, -> { String }, optional: true, nullable: true

        field :user, -> { Plaid::Types::SignalUser }, optional: true, nullable: false

        field :device, -> { Plaid::Types::SignalDevice }, optional: true, nullable: false

        field :risk_profile_key, -> { String }, optional: true, nullable: true

        field :ruleset_key, -> { String }, optional: true, nullable: true
      end
    end
  end
end
