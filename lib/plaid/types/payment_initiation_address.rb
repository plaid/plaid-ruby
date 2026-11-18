# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The optional address of the payment recipient's bank account. Required by most institutions outside of the UK.
    class PaymentInitiationAddress < Internal::Types::Model
      field :street, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :city, -> { String }, optional: false, nullable: false

      field :postal_code, -> { String }, optional: false, nullable: false

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
