# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data extracted from a user-submitted document.
    class PhysicalDocumentExtractedData < Internal::Types::Model
      field :id_number, -> { String }, optional: false, nullable: true

      field :category, -> { Plaid::Types::PhysicalDocumentCategory }, optional: false, nullable: false

      field :expiration_date, -> { String }, optional: false, nullable: true

      field :issue_date, -> { String }, optional: false, nullable: true

      field :issuing_country, -> { String }, optional: false, nullable: false

      field :issuing_region, -> { String }, optional: false, nullable: true

      field :date_of_birth, -> { String }, optional: false, nullable: true

      field :address, -> { Plaid::Types::IdentityVerificationDocumentAddressResponse }, optional: false, nullable: true

      field :name, -> { Plaid::Types::IdentityVerificationDocumentNameResponse }, optional: true, nullable: true
    end
  end
end
