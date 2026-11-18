# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Deduction on the paystub
    class PaystubDeduction < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: true

      field :is_pretax, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :total, -> { Float }, optional: false, nullable: true
    end
  end
end
