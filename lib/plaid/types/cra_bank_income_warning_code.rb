# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraBankIncomeWarningCode
      extend Plaid::Internal::Types::Enum

      IDENTITY_UNAVAILABLE = "IDENTITY_UNAVAILABLE"
      TRANSACTIONS_UNAVAILABLE = "TRANSACTIONS_UNAVAILABLE"
      REPORT_DELETED = "REPORT_DELETED"
      DATA_UNAVAILABLE = "DATA_UNAVAILABLE"
    end
  end
end
