# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Physical address of a business. Used for response schemas.
    class ResponseBusinessAddress < Internal::Types::Model
      field :street, -> { String }, optional: false, nullable: true

      field :street2, -> { String }, optional: false, nullable: true

      field :city, -> { String }, optional: false, nullable: true

      field :region, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
