# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The employer on the paystub.
    class PaystubOverrideEmployer < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: true

      field :address, -> { Plaid::Types::PaystubOverrideEmployerAddress }, optional: true, nullable: false
    end
  end
end
