# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Assets under management for the given end customer. Required for end customers with monthly service commitments.
    class PartnerEndCustomerAssetsUnderManagement < Internal::Types::Model
      field :amount, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: false
    end
  end
end
