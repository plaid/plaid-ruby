# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Represents a return on a Guaranteed ACH transfer that is included in the specified repayment.
    class TransferRepaymentReturn < Internal::Types::Model
      field :transfer_id, -> { String }, optional: false, nullable: false

      field :event_id, -> { Integer }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false
    end
  end
end
