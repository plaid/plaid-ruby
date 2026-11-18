# frozen_string_literal: true

module Plaid
  module Transfer
    module Types
      class TransferGetRequest < Internal::Types::Model
        field :transfer_id, -> { String }, optional: true, nullable: false

        field :authorization_id, -> { String }, optional: true, nullable: false

        field :originator_client_id, -> { String }, optional: true, nullable: true
      end
    end
  end
end
