# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A collection of details related to a fulfillment service or product in terms of request, process and result.
    class ServiceProductFulfillment < Internal::Types::Model
      field :service_product_fulfillment_detail, -> { Plaid::Types::ServiceProductFulfillmentDetail }, optional: false, nullable: false, api_name: "SERVICE_PRODUCT_FULFILLMENT_DETAIL"
    end
  end
end
