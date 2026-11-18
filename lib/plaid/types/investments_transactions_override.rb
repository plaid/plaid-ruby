# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An investment transaction on the account.
    class InvestmentsTransactionsOverride < Internal::Types::Model
      field :date, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :quantity, -> { Float }, optional: false, nullable: false

      field :price, -> { Float }, optional: false, nullable: false

      field :fees, -> { Float }, optional: true, nullable: false

      field :type, -> { String }, optional: false, nullable: false

      field :currency, -> { String }, optional: false, nullable: false

      field :security, -> { Plaid::Types::SecurityOverride }, optional: true, nullable: false
    end
  end
end
