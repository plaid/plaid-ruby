# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Address on the paystub
    class PaystubAddress < Internal::Types::Model
      field :city, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: true, nullable: true

      field :postal_code, -> { String }, optional: true, nullable: true

      field :region, -> { String }, optional: true, nullable: true

      field :street, -> { String }, optional: true, nullable: true

      field :line1, -> { String }, optional: true, nullable: true

      field :line2, -> { String }, optional: true, nullable: true

      field :state_code, -> { String }, optional: true, nullable: true
    end
  end
end
