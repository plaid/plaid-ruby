# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The address extracted from the document. The address must at least contain the following fields to be a valid
    # address: `street`, `city`, `country`. If any are missing or unable to be extracted, the address will be null.
    #
    # `region`, and `postal_code` may be null based on the addressing system. For example:
    #
    # Addresses from the United Kingdom will not include a region
    #
    # Addresses from Hong Kong will not include postal code
    #
    # Note: Optical Character Recognition (OCR) technology may sometimes extract incorrect data from a document.
    class IdentityVerificationDocumentAddressResponse < Internal::Types::Model
      field :street, -> { String }, optional: false, nullable: false

      field :city, -> { String }, optional: false, nullable: false

      field :region, -> { String }, optional: false, nullable: true

      field :postal_code, -> { String }, optional: false, nullable: true

      field :country, -> { String }, optional: false, nullable: false
    end
  end
end
