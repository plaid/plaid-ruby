# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The address of the student loan servicer. This is generally the remittance address to which payments should be
    # sent.
    class ServicerAddressData < Internal::Types::Model
      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :street, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: true
    end
  end
end
