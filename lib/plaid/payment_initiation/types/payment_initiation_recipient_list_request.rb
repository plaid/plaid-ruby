# frozen_string_literal: true

module Plaid
  module PaymentInitiation
    module Types
      class PaymentInitiationRecipientListRequest < Internal::Types::Model
        field :count, -> { Integer }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
