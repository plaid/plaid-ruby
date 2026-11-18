# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Pay By Bank flow. This is an optional field to configure
    # the user experience, and currently requires the amount field to be set.
    class LinkTokenCreateRequestPaymentConfiguration < Internal::Types::Model
      field :amount, -> { String }, optional: false, nullable: false

      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
