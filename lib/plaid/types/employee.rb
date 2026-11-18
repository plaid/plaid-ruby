# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the employee.
    class Employee < Internal::Types::Model
      field :address, -> { Plaid::Types::PaystubAddress }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true

      field :marital_status, -> { String }, optional: true, nullable: true

      field :taxpayer_id, -> { Plaid::Types::TaxpayerID }, optional: true, nullable: false
    end
  end
end
