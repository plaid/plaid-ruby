# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the components comprising an address.
    class IncomeVerificationPrecheckEmployerAddressData < Internal::Types::Model
      field :city, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false

      field :postal_code, -> { String }, optional: true, nullable: false

      field :region, -> { String }, optional: true, nullable: false

      field :street, -> { String }, optional: true, nullable: false
    end
  end
end
