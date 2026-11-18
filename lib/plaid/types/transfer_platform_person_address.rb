# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Home address of a person
    class TransferPlatformPersonAddress < Internal::Types::Model
      field :city, -> { String }, optional: false, nullable: false

      field :country, -> { String }, optional: false, nullable: false

      field :postal_code, -> { String }, optional: false, nullable: false

      field :region, -> { String }, optional: false, nullable: false

      field :street, -> { String }, optional: false, nullable: false

      field :street2, -> { String }, optional: true, nullable: false
    end
  end
end
