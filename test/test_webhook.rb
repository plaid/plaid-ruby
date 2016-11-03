require 'test_helper'

# Internal: The test for Plaid::Webhook.
class PlaidWebhookTest < MiniTest::Test
  def initial_transaction_webhook
    webhook = Plaid::Webhook.new(
      'message' => 'Initial transaction pull finished',
      'access_token' => '123456',
      'total_transactions' => 123,
      'code' => 0)

    assert_equal 'INITIAL_TRANSACTION', webhook.type

    assert_predicate webhook, :initial_transaction?
    refute_predicate webhook, :historical_transaction?
    refute_predicate webhook, :normal_transaction?
    refute_predicate webhook, :removed_transaction?
    refute_predicate webhook, :user_webhook_updated?
    refute_predicate webhook, :error_response?
    refute_predicate webhook, :income?
    refute_predicate webhook, :risk?
  end

  def test_removed_transaction_webhook
    webhook = Plaid::Webhook.new(
      'message' => 'Transactions removed',
      'access_token' => '123456',
      'code' => 3,
      'removed_transactions' => %w(1 2 3))

    assert_equal 'REMOVED_TRANSACTION', webhook.type

    refute_predicate webhook, :initial_transaction?
    refute_predicate webhook, :historical_transaction?
    refute_predicate webhook, :normal_transaction?
    assert_predicate webhook, :removed_transaction?
    refute_predicate webhook, :user_webhook_updated?
    refute_predicate webhook, :error_response?
    refute_predicate webhook, :income?
    refute_predicate webhook, :risk?

    assert_equal %w(1 2 3), webhook.removed_transactions_ids
  end

  def test_income
    webhook = Plaid::Webhook.new(
      'message' => 'income data available',
      'access_token' => '123456',
      'code' => 10)

    assert_equal 'INCOME', webhook.type

    refute_predicate webhook, :initial_transaction?
    refute_predicate webhook, :historical_transaction?
    refute_predicate webhook, :normal_transaction?
    refute_predicate webhook, :removed_transaction?
    refute_predicate webhook, :user_webhook_updated?
    refute_predicate webhook, :error_response?
    assert_predicate webhook, :income?
    refute_predicate webhook, :risk?
  end

  def test_error
    webhook = Plaid::Webhook.new(
      'message' => 'account locked',
      'resolve' => 'The account is locked. Please prompt the user to visit ' +
                   "the issuing institution's site and unlock their account.",
      'access_token' => '123456',
      'code' => 1205)

    assert_equal 'ERROR_RESPONSE', webhook.type

    refute_predicate webhook, :initial_transaction?
    refute_predicate webhook, :historical_transaction?
    refute_predicate webhook, :normal_transaction?
    refute_predicate webhook, :removed_transaction?
    refute_predicate webhook, :user_webhook_updated?
    assert_predicate webhook, :error_response?
    refute_predicate webhook, :income?
    refute_predicate webhook, :risk?

    err = webhook.error
    assert_kind_of Plaid::PlaidError, err
    assert_equal 1205, err.code
    assert_equal 'Code 1205: account locked. The account is locked. ' +
                 "Please prompt the user to visit the issuing institution's " +
                 'site and unlock their account.', err.message
  end
end
