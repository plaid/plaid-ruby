# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Physical address of a business. Used for input requests.
    class RequestBusinessAddress < Internal::Types::Model
      field :street, -> { String }, optional: false, nullable: false

      field :street2, -> { String }, optional: true, nullable: true

      field :city, -> { String }, optional: false, nullable: false

      field :region, -> { String }, optional: true, nullable: true

      field :postal_code, -> { String }, optional: true, nullable: true

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
