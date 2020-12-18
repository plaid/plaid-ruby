require_relative 'test_helper'

# Internal: The test for Plaid::PaymentInitiation.
class PlaidPaymentInitiationTest < PlaidTest
  # rubocop:disable Metrics/MethodLength
  def test_all_routes
    # create recipient
    create_recipient_response = client.payment_initiation.create_recipient(
      'John Doe',
      'GB33BUKB20201555555555',
      {
        street:      ['Street Name 999'],
        city:        'City',
        postal_code: '99999',
        country:     'GB'
      },
      account: '5555555',
      sort_code: '020155'
    )
    recipient_id = create_recipient_response.recipient_id
    refute_empty(recipient_id)

    # get recipient
    get_recipient_response = client.payment_initiation.get_recipient(
      recipient_id
    )
    refute_empty(get_recipient_response.recipient_id)
    refute_empty(get_recipient_response.name)
    refute_empty(get_recipient_response.iban)
    refute_empty(get_recipient_response.bacs)
    refute_empty(get_recipient_response.address)

    # list recipients
    list_recipients_response = client.payment_initiation.list_recipients
    refute_empty(list_recipients_response.recipients)

    # create single immediate payment
    create_payment_response = client.payment_initiation.create_payment(
      recipient_id,
      'testpayment',
      currency: 'GBP',
      value:    100.00
    )
    payment_id = create_payment_response.payment_id
    refute_empty(payment_id)

    # create link token
    create_link_token_response =
      client.link_token.create(
        user: {
          client_user_id: '123-fake-user-id'
        },
        client_name: 'Plaid Test',
        products: %w[payment_initiation],
        country_codes: ['GB'],
        language: 'en',
        payment_initiation: {
          payment_id: payment_id
        }
      )
    refute_empty(create_link_token_response.link_token)
    refute_empty(create_link_token_response.expiration)

    # create legacy payment_token (deprecated)
    create_payment_token_response =
      client.payment_initiation.create_payment_token(payment_id)
    refute_empty(create_payment_token_response.payment_token)
    refute_empty(create_payment_token_response.payment_token_expiration_time)

    # get payment
    get_payment_response = client.payment_initiation.get_payment(payment_id)
    refute_empty(get_payment_response.payment_id)
    refute_empty(get_payment_response.reference)
    refute_empty(get_payment_response.amount)
    assert_nil(get_payment_response.schedule)
    refute_empty(get_payment_response.status)
    refute_empty(get_payment_response.last_status_update)
    refute_empty(get_payment_response.recipient_id)

    # create standing order
    standing_order_create_payment_response =
      client.payment_initiation.create_payment(
        recipient_id,
        'testpayment',
        {
          currency: 'GBP',
          value: 100.00
        },
        schedule: {
          interval: 'MONTHLY',
          interval_execution_day: 1,
          start_date: (Date.today + 7).to_s
        }
      )
    standing_order_payment_id =
      standing_order_create_payment_response.payment_id
    refute_empty(standing_order_payment_id)

    # get payment
    get_payment_response =
      client.payment_initiation.get_payment(standing_order_payment_id)
    refute_empty(get_payment_response.payment_id)
    refute_empty(get_payment_response.reference)
    refute_empty(get_payment_response.amount)
    refute_empty(get_payment_response.schedule)
    refute_empty(get_payment_response.status)
    refute_empty(get_payment_response.last_status_update)
    refute_empty(get_payment_response.recipient_id)

    # list payments
    list_payments_response = client.payment_initiation.list_payments(
      count: 10
    )
    refute_empty(list_payments_response.payments)
  end
  # rubocop:enable Metrics/MethodLength
end
