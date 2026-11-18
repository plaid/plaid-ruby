# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A representation of where a transaction took place.
    #
    # Use this field to pass in structured location information you may have about your transactions. Providing location
    # data is optional but can increase result quality. If you have unstructured location information, it may be
    # appended to the `description` field.
    class ClientProvidedTransactionLocation < Internal::Types::Model
      field :country, -> { String }, optional: true, nullable: false

      field :region, -> { String }, optional: true, nullable: false

      field :city, -> { String }, optional: true, nullable: false

      field :address, -> { String }, optional: true, nullable: false

      field :postal_code, -> { String }, optional: true, nullable: false
    end
  end
end
