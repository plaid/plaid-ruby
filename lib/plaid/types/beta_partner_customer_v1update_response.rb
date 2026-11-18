# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response schema for `/beta/partner/customer/v1/update`.
    class BetaPartnerCustomerV1UpdateResponse < Internal::Types::Model
      field :end_customer, -> { Plaid::Types::BetaPartnerEndCustomer }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
