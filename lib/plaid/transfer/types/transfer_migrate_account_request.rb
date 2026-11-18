# frozen_string_literal: true

module Plaid
  module Transfer
    module Types
      class TransferMigrateAccountRequest < Internal::Types::Model
        field :account_number, -> { String }, optional: false, nullable: false

        field :routing_number, -> { String }, optional: false, nullable: false

        field :wire_routing_number, -> { String }, optional: true, nullable: false

        field :account_type, -> { String }, optional: false, nullable: false
      end
    end
  end
end
