# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Analysis of the data extracted from the submitted document.
    class PhysicalDocumentExtractedDataAnalysis < Internal::Types::Model
      field :name, -> { Plaid::Types::DocumentNameMatchCode }, optional: false, nullable: false

      field :date_of_birth, -> { Plaid::Types::DocumentDateOfBirthMatchCode }, optional: false, nullable: false

      field :expiration_date, -> { Plaid::Types::ExpirationDate }, optional: false, nullable: false

      field :issuing_country, -> { Plaid::Types::IssuingCountry }, optional: false, nullable: false
    end
  end
end
