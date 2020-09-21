require_relative 'test_helper'

class PlaidDepositSwitchTest < PlaidTest
  # rubocop:disable Metrics/MethodLength
  def test_all_routes
    # import item
    import_response = client.item.import(
      %w[identity auth],
      {
        user_id: 'user_good',
        auth_token: 'pass_good'
      },
      {}
    )
    refute_empty(import_response.access_token)
    access_token = import_response.access_token

    # get account id
    get_accounts_response = client.accounts.get(access_token)
    refute_empty(get_accounts_response.accounts)
    depository_accounts = get_accounts_response.accounts.select do |account|
      account[:type] == 'depository'
    end
    account_id = depository_accounts[0].account_id

    # create deposit switch
    create_response = client.deposit_switch.create(
      account_id,
      access_token
    )
    refute_empty(create_response.deposit_switch_id)
    deposit_switch_id = create_response.deposit_switch_id

    # get deposit switch
    get_response = client.deposit_switch.get(deposit_switch_id)
    refute_empty(get_response.deposit_switch_id)
    refute_empty(get_response.target_item_id)
    refute_empty(get_response.target_account_id)
    refute_empty(get_response.date_created)
    refute_empty(get_response.state)

    # create deposit switch token
    create_token_response =
      client.deposit_switch.create_token(deposit_switch_id)
    refute_empty(create_token_response.deposit_switch_token)
    refute_empty(create_token_response.deposit_switch_token_expiration_time)
  end
end

# rubocop:enable Metrics/MethodLength
