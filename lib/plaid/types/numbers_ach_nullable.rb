# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Identifying information for transferring money to or from a US account via ACH or wire transfer.
    class NumbersAchNullable < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :account, -> { String }, optional: false, nullable: true

      field :is_tokenized_account_number, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :routing, -> { String }, optional: false, nullable: true

      field :wire_routing, -> { String }, optional: false, nullable: true

      field :can_transfer_in, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :can_transfer_out, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
