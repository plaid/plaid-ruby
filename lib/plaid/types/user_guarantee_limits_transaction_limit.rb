# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's current per-transaction guarantee limit. A zero-dollar limit is returned with a value of `"0.00"`.
    class UserGuaranteeLimitsTransactionLimit < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false
    end
  end
end
