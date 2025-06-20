=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.645.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  class AccountSubtype
    N401A = "401a".freeze
    N401K = "401k".freeze
    N403_B = "403B".freeze
    N457B = "457b".freeze
    N529 = "529".freeze
    AUTO = "auto".freeze
    BROKERAGE = "brokerage".freeze
    BUSINESS = "business".freeze
    CASH_ISA = "cash isa".freeze
    CASH_MANAGEMENT = "cash management".freeze
    CD = "cd".freeze
    CHECKING = "checking".freeze
    COMMERCIAL = "commercial".freeze
    CONSTRUCTION = "construction".freeze
    CONSUMER = "consumer".freeze
    CREDIT_CARD = "credit card".freeze
    CRYPTO_EXCHANGE = "crypto exchange".freeze
    EBT = "ebt".freeze
    EDUCATION_SAVINGS_ACCOUNT = "education savings account".freeze
    FIXED_ANNUITY = "fixed annuity".freeze
    GIC = "gic".freeze
    HEALTH_REIMBURSEMENT_ARRANGEMENT = "health reimbursement arrangement".freeze
    HOME_EQUITY = "home equity".freeze
    HSA = "hsa".freeze
    ISA = "isa".freeze
    IRA = "ira".freeze
    KEOGH = "keogh".freeze
    LIF = "lif".freeze
    LIFE_INSURANCE = "life insurance".freeze
    LINE_OF_CREDIT = "line of credit".freeze
    LIRA = "lira".freeze
    LOAN = "loan".freeze
    LRIF = "lrif".freeze
    LRSP = "lrsp".freeze
    MONEY_MARKET = "money market".freeze
    MORTGAGE = "mortgage".freeze
    MUTUAL_FUND = "mutual fund".freeze
    NON_CUSTODIAL_WALLET = "non-custodial wallet".freeze
    NON_TAXABLE_BROKERAGE_ACCOUNT = "non-taxable brokerage account".freeze
    OTHER = "other".freeze
    OTHER_INSURANCE = "other insurance".freeze
    OTHER_ANNUITY = "other annuity".freeze
    OVERDRAFT = "overdraft".freeze
    PAYPAL = "paypal".freeze
    PAYROLL = "payroll".freeze
    PENSION = "pension".freeze
    PREPAID = "prepaid".freeze
    PRIF = "prif".freeze
    PROFIT_SHARING_PLAN = "profit sharing plan".freeze
    RDSP = "rdsp".freeze
    RESP = "resp".freeze
    RETIREMENT = "retirement".freeze
    RLIF = "rlif".freeze
    ROTH = "roth".freeze
    ROTH_401K = "roth 401k".freeze
    RRIF = "rrif".freeze
    RRSP = "rrsp".freeze
    SARSEP = "sarsep".freeze
    SAVINGS = "savings".freeze
    SEP_IRA = "sep ira".freeze
    SIMPLE_IRA = "simple ira".freeze
    SIPP = "sipp".freeze
    STOCK_PLAN = "stock plan".freeze
    STUDENT = "student".freeze
    THRIFT_SAVINGS_PLAN = "thrift savings plan".freeze
    TFSA = "tfsa".freeze
    TRUST = "trust".freeze
    UGMA = "ugma".freeze
    UTMA = "utma".freeze
    VARIABLE_ANNUITY = "variable annuity".freeze

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
