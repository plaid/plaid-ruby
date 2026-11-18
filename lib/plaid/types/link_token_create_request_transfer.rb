# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Transfer product.
    class LinkTokenCreateRequestTransfer < Internal::Types::Model
      field :intent_id, -> { String }, optional: true, nullable: false

      field :authorization_id, -> { String }, optional: true, nullable: false

      field :payment_profile_token, -> { String }, optional: true, nullable: false
    end
  end
end
