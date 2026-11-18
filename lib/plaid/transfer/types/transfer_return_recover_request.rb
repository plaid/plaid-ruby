# frozen_string_literal: true

module Plaid
  module Transfer
    module Types
      class TransferReturnRecoverRequest < Internal::Types::Model
        field :transfer_id, -> { String }, optional: false, nullable: false

        field :amount, -> { String }, optional: false, nullable: false

        field :idempotency_key, -> { String }, optional: false, nullable: false
      end
    end
  end
end
