# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the e-wallet balance
    class WalletBalance < Internal::Types::Model
      field :iso_currency_code, -> { String }, optional: false, nullable: false

      field :current, -> { Float }, optional: false, nullable: false

      field :available, -> { Float }, optional: false, nullable: false
    end
  end
end
