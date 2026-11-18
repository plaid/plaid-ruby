# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransactionCode
      extend Plaid::Internal::Types::Enum

      ADJUSTMENT = "adjustment"
      ATM = "atm"
      BANK_CHARGE = "bank charge"
      BILL_PAYMENT = "bill payment"
      CASH = "cash"
      CASH_ADVANCE = "cash advance"
      CASHBACK = "cashback"
      CHEQUE = "cheque"
      DIRECT_DEBIT = "direct debit"
      INTEREST = "interest"
      LATE_FEE = "late fee"
      MEMBERSHIP_FEE = "membership fee"
      PAYMENT = "payment"
      PURCHASE = "purchase"
      REFUND = "refund"
      RETURNED_ITEM_FEE = "returned item fee"
      STANDING_ORDER = "standing order"
      TRANSFER = "transfer"
    end
  end
end
