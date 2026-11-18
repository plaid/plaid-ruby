# frozen_string_literal: true

module Plaid
  module Partner
    module Types
      class PartnerCustomerRemoveRequest < Internal::Types::Model
        field :end_customer_client_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
