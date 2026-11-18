# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module StudentLoanStatusType
      extend Plaid::Internal::Types::Enum

      CANCELLED = "cancelled"
      CHARGED_OFF = "charged off"
      CLAIM = "claim"
      CONSOLIDATED = "consolidated"
      DEFERMENT = "deferment"
      DELINQUENT = "delinquent"
      DISCHARGED = "discharged"
      EXTENSION = "extension"
      FORBEARANCE = "forbearance"
      IN_GRACE = "in grace"
      IN_MILITARY = "in military"
      IN_SCHOOL = "in school"
      NOT_FULLY_DISBURSED = "not fully disbursed"
      OTHER = "other"
      PAID_IN_FULL = "paid in full"
      REFUNDED = "refunded"
      REPAYMENT = "repayment"
      TRANSFERRED = "transferred"
      PENDING_IDR = "pending idr"
    end
  end
end
