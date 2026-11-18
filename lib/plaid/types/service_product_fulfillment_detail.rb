# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Documentation not found in the MISMO model viewer and not provided by Freddie Mac.
    class ServiceProductFulfillmentDetail < Internal::Types::Model
      field :vendor_order_identifier, -> { String }, optional: false, nullable: true, api_name: "VendorOrderIdentifier"

      field :service_product_fulfillment_identifier, -> { Plaid::Types::ServiceProductFulfillmentIdentifier }, optional: false, nullable: false, api_name: "ServiceProductFulfillmentIdentifier"
    end
  end
end
