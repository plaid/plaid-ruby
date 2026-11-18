# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the accounts that the payment was distributed to.
    class PayStubDistributionBreakdown < Internal::Types::Model
      field :account_name, -> { String }, optional: false, nullable: true

      field :bank_name, -> { String }, optional: false, nullable: true

      field :current_amount, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :mask, -> { String }, optional: false, nullable: true

      field :type, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true
    end
  end
end
