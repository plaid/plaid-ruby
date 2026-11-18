# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the balance held with Plaid.
    class TransferBalance < Internal::Types::Model
      field :available, -> { String }, optional: false, nullable: false

      field :current, -> { String }, optional: true, nullable: false

      field :type, -> { Plaid::Types::TransferBalanceType }, optional: false, nullable: false
    end
  end
end
