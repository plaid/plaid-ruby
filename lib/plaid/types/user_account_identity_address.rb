# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's address.
    class UserAccountIdentityAddress < Internal::Types::Model
      field :city, -> { String }, optional: true, nullable: true

      field :region, -> { String }, optional: true, nullable: true

      field :street, -> { String }, optional: true, nullable: true

      field :street2, -> { String }, optional: true, nullable: true

      field :postal_code, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: true, nullable: true
    end
  end
end
