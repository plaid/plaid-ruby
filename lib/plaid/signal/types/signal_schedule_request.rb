# frozen_string_literal: true

module Plaid
  module Signal
    module Types
      class SignalScheduleRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :client_transaction_id, -> { String }, optional: false, nullable: false

        field :amount, -> { Float }, optional: false, nullable: false

        field :default_payment_method, -> { Plaid::Types::SignalScheduleDefaultPaymentMethod }, optional: true, nullable: false
      end
    end
  end
end
