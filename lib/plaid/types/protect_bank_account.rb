# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Bank account information associated with the incident.
    class ProtectBankAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: true, nullable: true

      field :account_number, -> { String }, optional: true, nullable: true

      field :routing_number, -> { String }, optional: true, nullable: true
    end
  end
end
