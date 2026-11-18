# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # (Deprecated) Specifies options for initializing Link for use with the Deposit Switch (beta) product. This field is
    # required if `deposit_switch` is included in the `products` array.
    class LinkTokenCreateRequestDepositSwitch < Internal::Types::Model
      field :deposit_switch_id, -> { String }, optional: false, nullable: false
    end
  end
end
