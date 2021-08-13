require_relative "test_helper"

# Internal: The test for Plaid::PaymentInitiation.
class PlaidPaymentInitiationTest < PlaidTest
  # rubocop:disable Metrics/MethodLength
  def test_all_routes
    # create recipient
    payment_initiation_recipient_create_request = Plaid::PaymentInitiationRecipientCreateRequest.new
    payment_initiation_recipient_create_request.name = "John Doe"
    payment_initiation_recipient_create_request.iban = "GB33BUKB20201555555555"
    payment_initiation_recipient_create_request.address = {
      street: ["Street Name 999"],
      city: "City",
      postal_code: "99999",
      country: "GB",
    }
    payment_initiation_recipient_create_request.bacs = {
      account: "26207729",
      sort_code: "560029",
    }

    create_recipient_response = client.payment_initiation_recipient_create(
      payment_initiation_recipient_create_request
    )
    recipient_id = create_recipient_response.recipient_id
    refute_empty(recipient_id)

    # get recipient
    payment_initiation_recipient_get_request = Plaid::PaymentInitiationRecipientGetRequest.new
    payment_initiation_recipient_get_request.recipient_id = recipient_id

    get_recipient_response = client.payment_initiation_recipient_get(
      payment_initiation_recipient_get_request
    )

    refute_empty(get_recipient_response.recipient_id)
    refute_empty(get_recipient_response.name)
    refute_empty(get_recipient_response.iban)
    refute_empty(get_recipient_response.bacs.to_hash)
    assert_kind_of(Plaid::RecipientBACSNullable, get_recipient_response.bacs)
    refute_empty(get_recipient_response.address.to_hash)
    assert_kind_of(Plaid::PaymentInitiationAddress, get_recipient_response.address)
    assert_kind_of(Plaid::PaymentInitiationRecipientGetResponse, get_recipient_response)

    # list recipients
    payment_initiation_recipient_list_request = Plaid::PaymentInitiationRecipientListRequest.new

    list_recipients_response = client.payment_initiation_payment_list(payment_initiation_recipient_list_request)
    refute_empty(list_recipients_response.payments)

    # create payment
    payment_initiation_payment_create_request = Plaid::PaymentInitiationPaymentCreateRequest.new
    payment_initiation_payment_create_request.recipient_id = recipient_id
    payment_initiation_payment_create_request.reference = "testpayment"
    payment_initiation_payment_create_request.amount = {
      value: 100.00,
      currency: "GBP",
    }

    create_payment_response = client.payment_initiation_payment_create(
      payment_initiation_payment_create_request
    )

    payment_id = create_payment_response.payment_id
    refute_empty(payment_id)
    assert_kind_of(Plaid::PaymentInitiationPaymentCreateResponse, create_payment_response)

    # get payment
    payment_initiation_payment_get_request = Plaid::PaymentInitiationPaymentGetRequest.new
    payment_initiation_payment_get_request.payment_id = payment_id

    get_payment_response = client.payment_initiation_payment_get(payment_initiation_payment_get_request)

    refute_empty(get_payment_response.payment_id)
    refute_empty(get_payment_response.reference)
    refute_empty(get_payment_response.amount.to_hash)
    assert_kind_of(Plaid::PaymentAmount, get_payment_response.amount)
    refute_empty(get_payment_response.status)
    refute_empty(get_payment_response.recipient_id)
    assert_kind_of(Plaid::PaymentInitiationPaymentGetResponse, get_payment_response)

    # list payments
    payment_initiation_payment_list_request = Plaid::PaymentInitiationPaymentListRequest.new
    payment_initiation_payment_list_request.count = 10

    list_payments_response = client.payment_initiation_payment_list(
      payment_initiation_payment_list_request
    )
    refute_empty(list_payments_response.payments)
    assert_kind_of(Plaid::PaymentInitiationPaymentListResponse, list_payments_response)
  end

  # rubocop:enable Metrics/MethodLength
end
