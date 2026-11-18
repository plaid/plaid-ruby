# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationRecipientCreateResponse defines the response schema for `/payment_initiation/recipient/create`
    class PaymentInitiationRecipientCreateResponse < Internal::Types::Model
      field :recipient_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
