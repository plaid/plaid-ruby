# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WatchlistScreeningDocumentType
      extend Plaid::Internal::Types::Enum

      BIRTH_CERTIFICATE = "birth_certificate"
      DRIVERS_LICENSE = "drivers_license"
      IMMIGRATION_NUMBER = "immigration_number"
      MILITARY_ID = "military_id"
      OTHER = "other"
      PASSPORT = "passport"
      PERSONAL_IDENTIFICATION = "personal_identification"
      RATION_CARD = "ration_card"
      SSN = "ssn"
      STUDENT_ID = "student_id"
      TAX_ID = "tax_id"
      TRAVEL_DOCUMENT = "travel_document"
      VOTER_ID = "voter_id"
    end
  end
end
