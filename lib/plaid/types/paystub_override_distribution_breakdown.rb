# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the accounts that the payment was distributed to.
    class PaystubOverrideDistributionBreakdown < Internal::Types::Model
      field :account_name, -> { String }, optional: true, nullable: true

      field :bank_name, -> { String }, optional: true, nullable: true

      field :current_amount, -> { Float }, optional: true, nullable: true

      field :currency, -> { String }, optional: true, nullable: true

      field :mask, -> { String }, optional: true, nullable: true

      field :type, -> { String }, optional: true, nullable: true
    end
  end
end
