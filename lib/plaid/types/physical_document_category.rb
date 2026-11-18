# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PhysicalDocumentCategory
      extend Plaid::Internal::Types::Enum

      DRIVERS_LICENSE = "drivers_license"
      ID_CARD = "id_card"
      PASSPORT = "passport"
      RESIDENCE_PERMIT_CARD = "residence_permit_card"
      RESIDENT_CARD = "resident_card"
      VISA = "visa"
    end
  end
end
