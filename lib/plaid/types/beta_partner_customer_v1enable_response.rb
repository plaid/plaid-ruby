# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response schema for `/beta/partner/customer/v1/enable`.
    class BetaPartnerCustomerV1EnableResponse < Internal::Types::Model
      field :end_customer_client_id, -> { String }, optional: true, nullable: false

      field :status, -> { Plaid::Types::PartnerEndCustomerStatus }, optional: true, nullable: false

      field :product_statuses, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :production_secret, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
