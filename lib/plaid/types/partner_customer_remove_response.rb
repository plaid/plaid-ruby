# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response schema for `/partner/customer/remove`.
    class PartnerCustomerRemoveResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
