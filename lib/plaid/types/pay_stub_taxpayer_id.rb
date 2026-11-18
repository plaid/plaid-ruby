# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Taxpayer ID of the individual receiving the paystub.
    class PayStubTaxpayerID < Internal::Types::Model
      field :id_type, -> { String }, optional: false, nullable: true

      field :id_mask, -> { String }, optional: false, nullable: true
    end
  end
end
