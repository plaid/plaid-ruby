# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PartnerEndCustomerRequirementDue
      extend Plaid::Internal::Types::Enum

      LEGAL_ENTITY_NAME = "legal_entity_name"
      WEBSITE = "website"
      APPLICATION_NAME = "application_name"
      IS_DILIGENCE_ATTESTED = "is_diligence_attested"
      TECHNICAL_CONTACT = "technical_contact"
      BILLING_CONTACT = "billing_contact"
      ADDRESS = "address"
      BANK_ADDENDUM_ACCEPTANCE = "bank_addendum_acceptance"
      QUESTIONNAIRES_CRA = "questionnaires.cra"
    end
  end
end
