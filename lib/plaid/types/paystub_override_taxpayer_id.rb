# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Taxpayer ID of the individual receiving the paystub.
    class PaystubOverrideTaxpayerID < Internal::Types::Model
      field :id_type, -> { String }, optional: true, nullable: true

      field :id_mask, -> { String }, optional: true, nullable: true
    end
  end
end
