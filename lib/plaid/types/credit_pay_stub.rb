# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an end user's pay stub.
    class CreditPayStub < Internal::Types::Model
      field :deductions, -> { Plaid::Types::CreditPayStubDeductions }, optional: false, nullable: false

      field :document_id, -> { String }, optional: false, nullable: true

      field :document_metadata, -> { Plaid::Types::CreditDocumentMetadata }, optional: false, nullable: false

      field :earnings, -> { Plaid::Types::CreditPayStubEarnings }, optional: false, nullable: false

      field :employee, -> { Plaid::Types::CreditPayStubEmployee }, optional: false, nullable: false

      field :employer, -> { Plaid::Types::CreditPayStubEmployer }, optional: false, nullable: false

      field :net_pay, -> { Plaid::Types::CreditPayStubNetPay }, optional: false, nullable: false

      field :pay_period_details, -> { Plaid::Types::PayStubPayPeriodDetails }, optional: false, nullable: false
    end
  end
end
