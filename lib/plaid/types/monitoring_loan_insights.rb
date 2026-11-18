# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the loan exposure subcategory of the report
    class MonitoringLoanInsights < Internal::Types::Model
      field :loan_payments_counts, -> { Plaid::Types::LoanPaymentsCounts }, optional: false, nullable: false

      field :loan_disbursements_count, -> { Float }, optional: false, nullable: false

      field :loan_payment_merchants_counts, -> { Plaid::Types::LoanPaymentsMerchantCounts }, optional: false, nullable: false
    end
  end
end
