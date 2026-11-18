# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LoanAccountSubtype
      extend Plaid::Internal::Types::Enum

      AUTO = "auto"
      BUSINESS = "business"
      COMMERCIAL = "commercial"
      COMMERCIAL_LINE_OF_CREDIT = "commercial line of credit"
      CONSTRUCTION = "construction"
      CONSUMER = "consumer"
      HOME_EQUITY = "home equity"
      HOME_EQUITY_LOAN = "home equity loan"
      LOAN = "loan"
      MORTGAGE = "mortgage"
      OVERDRAFT = "overdraft"
      LINE_OF_CREDIT = "line of credit"
      STUDENT = "student"
      OTHER = "other"
      ALL = "all"
    end
  end
end
