# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The failure reason if the event type for a transfer is `"failed"` or `"returned"`, or the adjustment reason if the
    # event type is `"adjustment"`. Null value otherwise.
    class TransferFailure < Internal::Types::Model
      field :failure_code, -> { String }, optional: true, nullable: true

      field :ach_return_code, -> { String }, optional: true, nullable: true

      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
