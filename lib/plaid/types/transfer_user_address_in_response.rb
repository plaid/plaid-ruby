# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The address associated with the account holder.
    class TransferUserAddressInResponse < Internal::Types::Model
      field :street, -> { String }, optional: false, nullable: true

      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: true
    end
  end
end
