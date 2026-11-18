# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The end customer's address.
    class PartnerEndCustomerAddress < Internal::Types::Model
      field :city, -> { String }, optional: true, nullable: false

      field :street, -> { String }, optional: true, nullable: false

      field :region, -> { String }, optional: true, nullable: false

      field :postal_code, -> { String }, optional: true, nullable: false

      field :country_code, -> { String }, optional: true, nullable: false
    end
  end
end
