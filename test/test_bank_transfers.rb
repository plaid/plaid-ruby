require_relative "test_helper"

# Internal: The test for Plaid::BankTransfers.
class PlaidBankTransfersTest < PlaidTest
  attr_reader :account

  def setup
    create_item initial_products: [:auth]

    accounts_get_request = Plaid::AccountsGetRequest.new({
      :access_token => access_token,
    })

    account_resp = client.accounts_get(accounts_get_request)
    @account = account_resp.accounts[0]
  end

  # Helper method to create a bank transfer
  def create_bank_transfer
    bank_transfer_create_request = Plaid::BankTransferCreateRequest.new(
      {
        :idempotency_key => Random.rand(0..1_000_000_000).to_s,
        :access_token => access_token,
        :account_id => account.account_id,
        :type => Plaid::BankTransferType::CREDIT,
        :network => Plaid::BankTransferNetwork::ACH,
        :amount => "1.00",
        :iso_currency_code => "USD",
        :description => "plaid",
        :ach_class => "ppd",
        :user => {
          legal_name: "Firstname Lastname",
        },
      }
    )

    create_response = client.bank_transfer_create(bank_transfer_create_request)
    refute_nil(create_response)
    assert_kind_of(Plaid::BankTransfer, create_response.bank_transfer)
    refute_nil(create_response.bank_transfer.id)
    assert_equal(account.account_id, create_response.bank_transfer.account_id)
    create_response.bank_transfer
  end

  # Used in case data is slow to propagate to read replica DB
  def request_and_retry(func, bt)
    num_retries = 3
    retries = 0
    while retries < num_retries
      retries += 1
      begin
        res = func.call(bt)
      rescue Exception => e
        if retries < num_retries
          puts "retrying failed test after sleeping for 1 second"
          sleep(1)
          next
        else
          puts "failed after retries"
          raise e
        end
      end
      return
    end
  end

  def create_and_post_bank_transfer
    bank_transfer = create_bank_transfer
    checks = lambda do |bank_transfer|
      sandbox_bank_transfer_simulate_request = Plaid::SandboxBankTransferSimulateRequest.new(
        {
          :bank_transfer_id => bank_transfer.id,
          :event_type => Plaid::BankTransferEventType::POSTED,
        }
      )

      simulate_response = client.sandbox_bank_transfer_simulate(sandbox_bank_transfer_simulate_request)
      refute_nil(simulate_response)
      assert_kind_of(Plaid::SandboxBankTransferSimulateResponse, simulate_response)
    end
    request_and_retry(checks, bank_transfer)
    bank_transfer
  end

  def test_create_success
    create_bank_transfer
  end

  def test_create_invalid_field
    begin
      client.bank_transfer_create({})
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "MISSING_FIELDS")
    end
  end

  def test_sandbox_bank_transfer_simulate_success
    create_and_post_bank_transfer
  end

  def test_cancel_success
    bank_transfer = create_bank_transfer
    checks = lambda do |bank_transfer|
      bank_transfer_cancel_request = Plaid::BankTransferCancelRequest.new({
        :bank_transfer_id => bank_transfer.id,
      })

      cancel_response = client.bank_transfer_cancel(bank_transfer_cancel_request)
      refute_nil(cancel_response)
      assert_kind_of(Plaid::BankTransferCancelResponse, cancel_response)
    end
    request_and_retry(checks, bank_transfer)
  end

  def test_cancel_not_cancelable
    bank_transfer = create_and_post_bank_transfer

    bank_transfer_cancel_request = Plaid::BankTransferCancelRequest.new({
      :bank_transfer_id => bank_transfer.id,
    })

    begin
      client.bank_transfer_cancel(bank_transfer_cancel_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "BANK_TRANSFER_NOT_CANCELLABLE")
    end
  end

  def test_migrate_account_success
    migrate_account_request = Plaid::BankTransferMigrateAccountRequest.new({
      :account_number => "100000000",
      :routing_number => "121122676",
      :account_type => "checking",
    })

    migrate_account_response = client.bank_transfer_migrate_account(migrate_account_request)
    refute_nil(migrate_account_response)
    assert_kind_of(Plaid::BankTransferMigrateAccountResponse, migrate_account_response)
    refute_nil(migrate_account_response.access_token)
    refute_nil(migrate_account_response.account_id)
  end

  def test_origination_balance_get_success
    bank_transfer_balance_get_request = Plaid::BankTransferBalanceGetRequest.new()

    balance_get_response = client.bank_transfer_balance_get(bank_transfer_balance_get_request)
    refute_nil(balance_get_response)
    refute_nil(balance_get_response.balance)
  end

  def test_get_success
    bank_transfer = create_bank_transfer
    checks = lambda do |bank_transfer|
      bank_transfer_get_request = Plaid::BankTransferGetRequest.new({
        :bank_transfer_id => bank_transfer.id,
      })

      get_response = client.bank_transfer_get(bank_transfer_get_request)
      refute_nil(get_response)
      assert_kind_of(Plaid::BankTransferGetResponse, get_response)
      assert_equal(get_response.bank_transfer, bank_transfer)
    end
    request_and_retry(checks, bank_transfer)
  end

  def test_list_success
    bank_transfer = create_bank_transfer
    checks = lambda do |bank_transfer|
      bank_transfer_list_request = Plaid::BankTransferListRequest.new({
        :count => 1,
      })

      list_response = client.bank_transfer_list(bank_transfer_list_request)
      refute_nil(list_response)
      assert_kind_of(Plaid::BankTransferListResponse, list_response)
      refute_nil(list_response.bank_transfers)
      assert_equal(1, list_response.bank_transfers.length)
      assert_equal(bank_transfer, list_response.bank_transfers[0])
    end
    request_and_retry(checks, bank_transfer)
  end

  def test_event_sync_success
    bank_transfer = create_and_post_bank_transfer
    checks = lambda do |bank_transfer|
      bank_transfer_event_sync_request = Plaid::BankTransferEventSyncRequest.new({
        :after_id => 0,
      })

      event_sync_response = client.bank_transfer_event_sync(bank_transfer_event_sync_request)
      refute_nil(event_sync_response)
      assert_kind_of(Plaid::BankTransferEventSyncResponse, event_sync_response)
      refute_nil(event_sync_response.bank_transfer_events)
      assert(event_sync_response.bank_transfer_events.length >= 2)
    end
    request_and_retry(checks, bank_transfer)
  end

  def test_event_list_success
    bank_transfer = create_and_post_bank_transfer
    checks = lambda do |bank_transfer|
      bank_transfer_list_request = Plaid::BankTransferEventListRequest.new({
        bank_transfer_id: bank_transfer.id,
      })

      event_list_response = client.bank_transfer_event_list(bank_transfer_list_request)
      refute_nil(event_list_response)
      assert_kind_of(Plaid::BankTransferEventListResponse, event_list_response)
      refute_nil(event_list_response.bank_transfer_events)
      assert_equal(2, event_list_response.bank_transfer_events.length)
      event_list_response.bank_transfer_events.each do |event|
        assert_equal(bank_transfer.id, event.bank_transfer_id)
      end
    end
    request_and_retry(checks, bank_transfer)
  end
end
