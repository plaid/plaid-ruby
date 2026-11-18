# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A holding on the account.
    class HoldingsOverride < Internal::Types::Model
      field :institution_price, -> { Float }, optional: false, nullable: false

      field :institution_price_as_of, -> { String }, optional: true, nullable: false

      field :cost_basis, -> { Float }, optional: true, nullable: false

      field :quantity, -> { Float }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false

      field :security, -> { Plaid::Types::SecurityOverride }, optional: false, nullable: false
    end
  end
end
