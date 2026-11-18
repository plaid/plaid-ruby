# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information specific to wire transfers.
    class TransferWireDetails < Internal::Types::Model
      field :message_to_beneficiary, -> { String }, optional: true, nullable: true

      field :wire_return_fee, -> { String }, optional: true, nullable: true
    end
  end
end
