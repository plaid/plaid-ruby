# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the employer on the paystub
    class PaystubEmployer < Internal::Types::Model
      field :address, -> { Plaid::Types::PaystubAddress }, optional: true, nullable: false

      field :name, -> { String }, optional: false, nullable: true
    end
  end
end
