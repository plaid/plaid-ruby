# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The employee on the paystub.
    class PaystubOverrideEmployee < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false

      field :address, -> { Plaid::Types::PaystubOverrideEmployeeAddress }, optional: true, nullable: false

      field :marital_status, -> { String }, optional: true, nullable: true

      field :taxpayer_id, -> { Plaid::Types::PaystubOverrideTaxpayerID }, optional: true, nullable: false
    end
  end
end
