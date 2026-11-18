# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the balance of a bank transfer
    class BankTransferBalance < Internal::Types::Model
      field :available, -> { String }, optional: false, nullable: false

      field :transactable, -> { String }, optional: false, nullable: false
    end
  end
end
