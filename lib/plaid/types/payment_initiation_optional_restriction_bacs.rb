# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object used to restrict the accounts used for payments. If provided, the end user will be able to send
    # payments only from the specified bank account.
    class PaymentInitiationOptionalRestrictionBacs < Internal::Types::Model
      field :account, -> { String }, optional: true, nullable: false

      field :sort_code, -> { String }, optional: true, nullable: false
    end
  end
end
