# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationPaymentCreateRequest < Internal::Types::Model
        field :recipient_id, -> { String }, optional: false, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :reference, -> { String }, optional: false, nullable: false

        field :amount, -> { Plaid::Types::PaymentAmount }, optional: false, nullable: false

        field :schedule, -> { Plaid::Types::ExternalPaymentScheduleRequest }, optional: true, nullable: false

        field :options, -> { Plaid::Types::ExternalPaymentOptions }, optional: true, nullable: true
      end
    end
  end
end
