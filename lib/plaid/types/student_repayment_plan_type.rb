# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module StudentRepaymentPlanType
      extend Plaid::Internal::Types::Enum

      EXTENDED_GRADUATED = "extended graduated"
      EXTENDED_STANDARD = "extended standard"
      GRADUATED = "graduated"
      INCOME_CONTINGENT_REPAYMENT = "income-contingent repayment"
      INCOME_BASED_REPAYMENT = "income-based repayment"
      INCOME_SENSITIVE_REPAYMENT = "income-sensitive repayment"
      INTEREST_ONLY = "interest only"
      OTHER = "other"
      PAY_AS_YOU_EARN = "pay as you earn"
      REVISED_PAY_AS_YOU_EARN = "revised pay as you earn"
      STANDARD = "standard"
      SAVING_ON_A_VALUABLE_EDUCATION = "saving on a valuable education"
    end
  end
end
