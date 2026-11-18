# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the employee.
    class CreditPayStubEmployee < Internal::Types::Model
      field :address, -> { Plaid::Types::CreditPayStubAddress }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true

      field :marital_status, -> { String }, optional: false, nullable: true

      field :taxpayer_id, -> { Plaid::Types::PayStubTaxpayerID }, optional: false, nullable: false
    end
  end
end
