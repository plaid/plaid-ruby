# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationPaymentListRequest < Internal::Types::Model
        field :count, -> { Integer }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true

        field :consent_id, -> { String }, optional: true, nullable: true
      end
    end
  end
end
