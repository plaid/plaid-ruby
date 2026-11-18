# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The originator's address.
    class TransferOriginatorAddress < Internal::Types::Model
      field :city, -> { String }, optional: false, nullable: false

      field :street, -> { String }, optional: false, nullable: false

      field :region, -> { String }, optional: false, nullable: false

      field :postal_code, -> { String }, optional: false, nullable: false

      field :country_code, -> { String }, optional: false, nullable: false
    end
  end
end
