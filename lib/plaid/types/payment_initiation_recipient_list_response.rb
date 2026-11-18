# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # PaymentInitiationRecipientListResponse defines the response schema for `/payment_initiation/recipient/list`
    class PaymentInitiationRecipientListResponse < Internal::Types::Model
      field :recipients, -> { Internal::Types::Array[Plaid::Types::PaymentInitiationRecipient] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: true, nullable: false
    end
  end
end
