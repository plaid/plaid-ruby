=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.128.4

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'date'
require 'time'

module Plaid
  class InvestmentAccountSubtype
    N529 = "529".freeze
    N401A = "401a".freeze
    N401K = "401k".freeze
    N403_B = "403B".freeze
    N457B = "457b".freeze
    BROKERAGE = "brokerage".freeze
    CASH_ISA = "cash isa".freeze
    EDUCATION_SAVINGS_ACCOUNT = "education savings account".freeze
    FIXED_ANNUITY = "fixed annuity".freeze
    GIC = "gic".freeze
    HEALTH_REIMBURSEMENT_ARRANGEMENT = "health reimbursement arrangement".freeze
    HSA = "hsa".freeze
    IRA = "ira".freeze
    ISA = "isa".freeze
    KEOGH = "keogh".freeze
    LIF = "lif".freeze
    LIFE_INSURANCE = "life insurance".freeze
    LIRA = "lira".freeze
    LRIF = "lrif".freeze
    LRSP = "lrsp".freeze
    MUTUAL_FUND = "mutual fund".freeze
    NON_TAXABLE_BROKERAGE_ACCOUNT = "non-taxable brokerage account".freeze
    OTHER = "other".freeze
    OTHER_ANNUITY = "other annuity".freeze
    OTHER_INSURANCE = "other insurance".freeze
    PENSION = "pension".freeze
    PRIF = "prif".freeze
    PROFIT_SHARING_PLAN = "profit sharing plan".freeze
    QSHR = "qshr".freeze
    RDSP = "rdsp".freeze
    RESP = "resp".freeze
    RETIREMENT = "retirement".freeze
    RLIF = "rlif".freeze
    ROTH = "roth".freeze
    ROTH_401K = "roth 401k".freeze
    RRIF = "rrif".freeze
    RRSP = "rrsp".freeze
    SARSEP = "sarsep".freeze
    SEP_IRA = "sep ira".freeze
    SIMPLE_IRA = "simple ira".freeze
    SIPP = "sipp".freeze
    STOCK_PLAN = "stock plan".freeze
    TFSA = "tfsa".freeze
    TRUST = "trust".freeze
    UGMA = "ugma".freeze
    UTMA = "utma".freeze
    VARIABLE_ANNUITY = "variable annuity".freeze
    ALL = "all".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      # We do not validate that the value is one of the enums set in the OpenAPI
      # file because we want to be able to add to our list of enums without
      # breaking this client library.
      value
    end
  end

end
