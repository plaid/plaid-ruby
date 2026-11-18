# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response schema for `/partner/customer/get`.
    class PartnerCustomerGetResponse < Internal::Types::Model
      field :end_customer, -> { Plaid::Types::PartnerEndCustomer }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
