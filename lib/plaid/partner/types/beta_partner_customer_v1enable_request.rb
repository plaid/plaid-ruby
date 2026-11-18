# frozen_string_literal: true

module Plaid
  module Partner
    module Types
      class BetaPartnerCustomerV1EnableRequest < Internal::Types::Model
        field :end_customer_client_id, -> { String }, optional: false, nullable: false

        field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: false
      end
    end
  end
end
