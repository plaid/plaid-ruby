# Plaid::StandaloneInvestmentTransactionSubtype

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_fee** | **String** | Fees paid for account maintenance | [optional] |
| **assignment** | **String** | Assignment of short option holding | [optional] |
| **buy** | **String** | Purchase to open or increase a position | [optional] |
| **buy_to_cover** | **String** | Purchase to close a short position | [optional] |
| **contribution** | **String** | Inflow of assets into a tax-advantaged account | [optional] |
| **deposit** | **String** | Inflow of cash into an account | [optional] |
| **distribution** | **String** | Outflow of assets from a tax-advantaged account | [optional] |
| **dividend** | **String** | Inflow of cash from a dividend | [optional] |
| **dividend_reinvestment** | **String** | Purchase using proceeds from a cash dividend | [optional] |
| **exercise** | **String** | Exercise of an option or warrant contract | [optional] |
| **expire** | **String** | Expiration of an option or warrant contract  | [optional] |
| **fund_fee** | **String** | Fees paid for administration of a mutual fund or other pooled investment vehicle | [optional] |
| **interest** | **String** | Inflow of cash from interest | [optional] |
| **interest_receivable** | **String** | Inflow of cash from interest receivable | [optional] |
| **interest_reinvestment** | **String** | Purchase using proceeds from a cash interest payment | [optional] |
| **legal_fee** | **String** | Fees paid for legal charges or services | [optional] |
| **loan_payment** | **String** | Inflow of cash related to payment on a loan | [optional] |
| **long_term_capital_gain** | **String** | Long-term capital gain received as cash | [optional] |
| **long_term_capital_gain_reinvestment** | **String** | Purchase using long-term capital gain cash proceeds | [optional] |
| **management_fee** | **String** | Fees paid for investment management of a mutual fund or other pooled investment vehicle | [optional] |
| **margin_expense** | **String** | Fees paid for maintaining margin debt | [optional] |
| **merger** | **String** | Stock exchanged at a pre-defined ratio as part of a merger between companies | [optional] |
| **miscellaneous_fee** | **String** | Fee associated with various account or holding actions | [optional] |
| **non_qualified_dividend** | **String** | Inflow of cash from a non-qualified dividend | [optional] |
| **non_resident_tax** | **String** | Taxes paid on behalf of the investor for non-residency in investment jurisdiction | [optional] |
| **pending_credit** | **String** | Pending inflow of cash | [optional] |
| **pending_debit** | **String** | Pending outflow of cash | [optional] |
| **qualified_dividend** | **String** | Inflow of cash from a qualified dividend | [optional] |
| **rebalance** | **String** | Rebalancing transaction (buy or sell) with no net impact to value in the account | [optional] |
| **return_of_principal** | **String** | Repayment of loan principal | [optional] |
| **sell** | **String** | Sell to close or decrease an existing holding | [optional] |
| **sell_short** | **String** | Sell to open a short position | [optional] |
| **short_term_capital_gain** | **String** | Short-term capital gain received as cash | [optional] |
| **short_term_capital_gain_reinvestment** | **String** | Purchase using short-term capital gain cash proceeds | [optional] |
| **spin_off** | **String** | Inflow of stock from spin-off transaction of an existing holding | [optional] |
| **split** | **String** | Inflow of stock from a forward split of an existing holding | [optional] |
| **stock_distribution** | **String** | Inflow of stock from a distribution | [optional] |
| **tax** | **String** | Taxes paid on behalf of the investor | [optional] |
| **tax_withheld** | **String** | Taxes withheld on behalf of the customer | [optional] |
| **transfer** | **String** | Movement of assets into or out of an account | [optional] |
| **transfer_fee** | **String** | Fees incurred for transfer of a holding or account | [optional] |
| **trust_fee** | **String** | Fees related to adminstration of a trust account | [optional] |
| **unqualified_gain** | **String** | Unqualified capital gain received as cash | [optional] |
| **withdrawal** | **String** | Outflow of cash from an account | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::StandaloneInvestmentTransactionSubtype.new(
  account_fee: null,
  assignment: null,
  buy: null,
  buy_to_cover: null,
  contribution: null,
  deposit: null,
  distribution: null,
  dividend: null,
  dividend_reinvestment: null,
  exercise: null,
  expire: null,
  fund_fee: null,
  interest: null,
  interest_receivable: null,
  interest_reinvestment: null,
  legal_fee: null,
  loan_payment: null,
  long_term_capital_gain: null,
  long_term_capital_gain_reinvestment: null,
  management_fee: null,
  margin_expense: null,
  merger: null,
  miscellaneous_fee: null,
  non_qualified_dividend: null,
  non_resident_tax: null,
  pending_credit: null,
  pending_debit: null,
  qualified_dividend: null,
  rebalance: null,
  return_of_principal: null,
  sell: null,
  sell_short: null,
  short_term_capital_gain: null,
  short_term_capital_gain_reinvestment: null,
  spin_off: null,
  split: null,
  stock_distribution: null,
  tax: null,
  tax_withheld: null,
  transfer: null,
  transfer_fee: null,
  trust_fee: null,
  unqualified_gain: null,
  withdrawal: null
)
```

