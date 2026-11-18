# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The failure reason if the type of this transfer is `"failed"` or `"reversed"`. Null value otherwise.
    class BankTransferFailure < Internal::Types::Model
      field :ach_return_code, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: true
    end
  end
end
