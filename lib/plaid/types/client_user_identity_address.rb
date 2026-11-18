# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # User address information.
    class ClientUserIdentityAddress < Internal::Types::Model
      field :street1, -> { String }, optional: true, nullable: true, api_name: "street_1"

      field :street2, -> { String }, optional: true, nullable: true, api_name: "street_2"

      field :city, -> { String }, optional: true, nullable: true

      field :region, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: false, nullable: false

      field :postal_code, -> { String }, optional: true, nullable: true

      field :primary, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
