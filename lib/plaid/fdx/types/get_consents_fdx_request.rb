# frozen_string_literal: true

module Plaid
  module Fdx
    module Types
      class GetConsentsFdxRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: false, nullable: false, api_name: "customerId"

        field :status, -> { Plaid::Types::FdxConsentGrantStatus }, optional: true, nullable: false
      end
    end
  end
end
