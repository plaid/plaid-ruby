# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraLoanStatus
      extend Plaid::Internal::Types::Enum

      APPROVED = "APPROVED"
      DECLINED = "DECLINED"
      BOOKED = "BOOKED"
      CURRENT = "CURRENT"
      DELINQUENT = "DELINQUENT"
      DEFAULT = "DEFAULT"
      CHARGED_OFF = "CHARGED_OFF"
      TRANSFERRED = "TRANSFERRED"
      PAID_OFF = "PAID_OFF"
      OTHER = "OTHER"
    end
  end
end
