# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TaxpayerIdentifierType
      extend Plaid::Internal::Types::Enum

      INDIVIDUAL_TAXPAYER_IDENTIFICATION_NUMBER = "IndividualTaxpayerIdentificationNumber"
      SOCIAL_SECURITY_NUMBER = "SocialSecurityNumber"
    end
  end
end
