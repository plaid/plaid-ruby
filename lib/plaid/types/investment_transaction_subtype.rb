# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module InvestmentTransactionSubtype
      extend Plaid::Internal::Types::Enum

      ACCOUNT_FEE = "account fee"
      ADJUSTMENT = "adjustment"
      ASSIGNMENT = "assignment"
      BUY = "buy"
      BUY_TO_COVER = "buy to cover"
      CONTRIBUTION = "contribution"
      DEPOSIT = "deposit"
      DISTRIBUTION = "distribution"
      DIVIDEND = "dividend"
      DIVIDEND_REINVESTMENT = "dividend reinvestment"
      EXERCISE = "exercise"
      EXPIRE = "expire"
      INTEREST = "interest"
      INTEREST_RECEIVABLE = "interest receivable"
      INTEREST_REINVESTMENT = "interest reinvestment"
      LEGAL_FEE = "legal fee"
      LONG_TERM_CAPITAL_GAIN = "long-term capital gain"
      LONG_TERM_CAPITAL_GAIN_REINVESTMENT = "long-term capital gain reinvestment"
      MANAGEMENT_FEE = "management fee"
      MARGIN_EXPENSE = "margin expense"
      MERGER = "merger"
      MISCELLANEOUS_FEE = "miscellaneous fee"
      NON_QUALIFIED_DIVIDEND = "non-qualified dividend"
      NON_RESIDENT_TAX = "non-resident tax"
      PENDING_CREDIT = "pending credit"
      PENDING_DEBIT = "pending debit"
      QUALIFIED_DIVIDEND = "qualified dividend"
      RETURN_OF_PRINCIPAL = "return of principal"
      REQUEST = "request"
      SELL = "sell"
      SELL_SHORT = "sell short"
      SEND = "send"
      SHORT_TERM_CAPITAL_GAIN = "short-term capital gain"
      SHORT_TERM_CAPITAL_GAIN_REINVESTMENT = "short-term capital gain reinvestment"
      SPIN_OFF = "spin off"
      SPLIT = "split"
      STOCK_DISTRIBUTION = "stock distribution"
      TAX = "tax"
      TAX_WITHHELD = "tax withheld"
      TRADE = "trade"
      TRANSFER = "transfer"
      TRANSFER_FEE = "transfer fee"
      TRUST_FEE = "trust fee"
      UNQUALIFIED_GAIN = "unqualified gain"
      WITHDRAWAL = "withdrawal"
    end
  end
end
