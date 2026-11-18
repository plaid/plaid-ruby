# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response schema for `/partner/customer/enable`.
    class PartnerCustomerEnableResponse < Internal::Types::Model
      field :production_secret, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
