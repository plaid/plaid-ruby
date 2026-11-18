# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The address associated with the account holder.
    class TransferUserAddressInRequest < Internal::Types::Model
      field :street, -> { String }, optional: true, nullable: false

      field :city, -> { String }, optional: true, nullable: false

      field :region, -> { String }, optional: true, nullable: false

      field :postal_code, -> { String }, optional: true, nullable: false

      field :country, -> { String }, optional: true, nullable: false
    end
  end
end
