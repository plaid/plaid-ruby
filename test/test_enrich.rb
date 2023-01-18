require_relative 'test_helper'

# Internal: The test for Plaid::Enrich.
class PlaidEnrichTest < PlaidTest
  def test_get
    sample_transactions_to_enrich = [
      Plaid::ClientProvidedTransaction.new({
        id: "1",
        description: "TST *JETTIES BAGELS",
        amount: 10.00,
        direction: Plaid::EnrichTransactionDirection::OUTFLOW,
        location: Plaid::ClientProvidedTransactionLocation.new({
          city: "Ipswich",
          region: "MA",
        }),
        iso_currency_code: "USD",
      }),
      Plaid::ClientProvidedTransaction.new({
        id: "2",
        description: "AMAZON.COM*MJ3LO9AN2",
        amount: 10.00,
        direction: Plaid::EnrichTransactionDirection::OUTFLOW,
        iso_currency_code: "USD",
      }),
      Plaid::ClientProvidedTransaction.new({
        id: "3",
        description: "GOOGLE *FRESHBOOKS",
        amount: 10.00,
        direction: Plaid::EnrichTransactionDirection::OUTFLOW,
        iso_currency_code: "USD",
      }),
      Plaid::ClientProvidedTransaction.new({
        id: "4",
        description: "EARNIN TRANSFER",
        amount: 100.00,
        direction: Plaid::EnrichTransactionDirection::INFLOW,
        iso_currency_code: "USD",
      })
    ]

    transactions_enrich_get_request = Plaid::TransactionsEnrichGetRequest.new

    transactions_enrich_get_request.account_type = "depository"
    transactions_enrich_get_request.transactions = sample_transactions_to_enrich

    response = client.transactions_enrich(transactions_enrich_get_request)
    assert_kind_of(Plaid::TransactionsEnrichGetResponse, response)

    refute_empty(response.enriched_transactions)
    assert_equal(sample_transactions_to_enrich.length, response.enriched_transactions.length)

    response.enriched_transactions.each do |item|
      assert_kind_of(Float, item.amount)
      refute_nil(item.description)
      refute_nil(item.direction)
      refute_nil(item.enrichments)
      refute_nil(item.id)
    end
  end
end
