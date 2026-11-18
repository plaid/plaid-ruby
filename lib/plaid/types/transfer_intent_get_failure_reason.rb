# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The reason for a failed transfer intent. Returned only if the transfer intent status is `failed`. Null otherwise.
    class TransferIntentGetFailureReason < Internal::Types::Model
      field :error_type, -> { String }, optional: true, nullable: false

      field :error_code, -> { String }, optional: true, nullable: false

      field :error_message, -> { String }, optional: true, nullable: false
    end
  end
end
