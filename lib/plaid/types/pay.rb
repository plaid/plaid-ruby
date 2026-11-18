# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing a monetary amount.
    class Pay < Internal::Types::Model
      field :amount, -> { Float }, optional: true, nullable: true

      field :currency, -> { String }, optional: true, nullable: true
    end
  end
end
