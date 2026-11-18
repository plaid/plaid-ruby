# frozen_string_literal: true

module Plaid
  module Transfer
    module Types
      class TransferCancelRequest < Internal::Types::Model
        field :transfer_id, -> { String }, optional: false, nullable: false

        field :originator_client_id, -> { String }, optional: true, nullable: true

        field :reason_code, -> { Plaid::Types::ReasonCode }, optional: true, nullable: false
      end
    end
  end
end
