# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Payment Initiation (Europe) product. This field is
    # required if `payment_initiation` is included in the `products` array. Either `payment_id` or `consent_id` must be
    # provided.
    class LinkTokenCreateRequestPaymentInitiation < Internal::Types::Model
      field :payment_id, -> { String }, optional: true, nullable: false

      field :consent_id, -> { String }, optional: true, nullable: false
    end
  end
end
