# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Typed attributes of the end user that Plaid models directly in transfer authorization decisioning. Use
    # `custom_attributes` for any other risk-relevant context.
    class TransferAuthorizationUserAttributes < Internal::Types::Model
      field :account_created_time, -> { String }, optional: true, nullable: true

      field :successful_payment_count, -> { Integer }, optional: true, nullable: true
    end
  end
end
