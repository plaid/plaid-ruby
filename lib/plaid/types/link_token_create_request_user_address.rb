# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The user's address. Used only for Identity Verification and the Identity Match in Link workflows. If provided for
    # Identity Verification, the user will not be shown fields to enter their address in the Identity Verification flow.
    # If provided for Identity Match, the provided data will be used to match against the user's address. May be
    # omitted, but if not omitted, all fields marked as required must be provided.
    class LinkTokenCreateRequestUserAddress < Internal::Types::Model
      field :street, -> { String }, optional: true, nullable: true

      field :street2, -> { String }, optional: true, nullable: true

      field :city, -> { String }, optional: true, nullable: true

      field :region, -> { String }, optional: true, nullable: true

      field :postal_code, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
