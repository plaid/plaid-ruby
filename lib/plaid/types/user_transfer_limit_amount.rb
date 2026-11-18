# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A transfer limit amount and its currency.
    class UserTransferLimitAmount < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false
    end
  end
end
