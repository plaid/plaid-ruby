# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The set of results for a Link session.
    class LinkSessionResults < Internal::Types::Model
      field :item_add_results, -> { Internal::Types::Array[Plaid::Types::LinkSessionItemAddResult] }, optional: false, nullable: false

      field :cra_item_add_results, -> { Internal::Types::Array[Plaid::Types::LinkSessionCraItemAddResult] }, optional: false, nullable: false

      field :cra_update_results, -> { Internal::Types::Array[Plaid::Types::LinkSessionCraUpdateResult] }, optional: false, nullable: false

      field :bank_income_results, -> { Internal::Types::Array[Plaid::Types::LinkSessionBankIncomeResult] }, optional: false, nullable: false

      field :payroll_income_results, -> { Internal::Types::Array[Plaid::Types::LinkSessionPayrollIncomeResult] }, optional: false, nullable: false

      field :document_income_results, -> { Plaid::Types::CreditSessionDocumentIncomeResult }, optional: false, nullable: true

      field :cra_document_upload_results, -> { Plaid::Types::LinkSessionCraDocumentUploadResult }, optional: true, nullable: true

      field :cra_report_results, -> { Plaid::Types::LinkSessionCraReportResult }, optional: false, nullable: true
    end
  end
end
