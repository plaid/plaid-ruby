# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A map of permissible purposes to their corresponding use cases.
    class PartnerEndCustomerCraPurposes < Internal::Types::Model
      field :written_instruction, -> { Plaid::Types::PartnerEndCustomerCraUseCases }, optional: true, nullable: false, api_name: "WRITTEN_INSTRUCTION"

      field :extension_of_credit_or_account_review, -> { Plaid::Types::PartnerEndCustomerCraUseCases }, optional: true, nullable: false, api_name: "EXTENSION_OF_CREDIT_OR_ACCOUNT_REVIEW"

      field :employment, -> { Plaid::Types::PartnerEndCustomerCraUseCases }, optional: true, nullable: false, api_name: "EMPLOYMENT"

      field :insurance_underwriting, -> { Plaid::Types::PartnerEndCustomerCraUseCases }, optional: true, nullable: false, api_name: "INSURANCE_UNDERWRITING"

      field :license_eligibility, -> { Plaid::Types::PartnerEndCustomerCraUseCases }, optional: true, nullable: false, api_name: "LICENSE_ELIGIBILITY"

      field :risk_assessment, -> { Plaid::Types::PartnerEndCustomerCraUseCases }, optional: true, nullable: false, api_name: "RISK_ASSESSMENT"

      field :business_need_transaction, -> { Plaid::Types::PartnerEndCustomerCraUseCases }, optional: true, nullable: false, api_name: "BUSINESS_NEED_TRANSACTION"

      field :business_need_account_review, -> { Plaid::Types::PartnerEndCustomerCraUseCases }, optional: true, nullable: false, api_name: "BUSINESS_NEED_ACCOUNT_REVIEW"
    end
  end
end
