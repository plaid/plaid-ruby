module Plaid
  # Public: Class used to call the Deposit Switch product.
  class DepositSwitch < BaseProduct
  # Public: Get Deposit Switch information.
  #
  # Does a POST /deposit_switch/get call which fetches deposit switch
  # associated with a deposit switch id.
  #
  # deposit_switch_id - deposit_switch_id of a deposit switch to fetch
  #                     deposit switch for
  #
  # Returns the DepsoitSwitchResponse object with deposit switch data.
    def get(deposit_switch_id)
        post_with_auth 'deposit_switch/get',
                      GetResponse,
                      deposit_switch_id: deposit_switch_id
    end

    # Public: Response wrapper for /deposit_switch/get.
    class GetResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The ID associated with the deposit switch.
      property :deposit_switch_id

      ##
      # :attr_reader:
      # Public: The ID of the item that the deposit switch was a target to.
      property :target_item_id

      ##
      # :attr_reader:
      # Public: The ID of the account that the deposit switch was a target to.
      property :target_account_id

      ##
      # :attr_reader:
      # Public: The state that the deposit switch is in.
      property :state

      ##
      # :attr_reader:
      # Public: The date on which the deposit switch was created.
      property :date_created

      ##
      # :attr_reader:
      # Public: Whether the target account receives the remainder.
      property :is_allocated_remainder

      ##
      # :attr_reader:
      # Public: Whether the account has multiple allocations
      property :account_has_multiple_allocations

      ##
      # :attr_reader:
      # Public: The percent of pay going to the target account, if applicable
      property :percent_allocated

      ##
      # :attr_reader:
      # Public: The date on which the deposit switch was completed.
      property :date_completed
    end

    # Public: Create Deposit Switch.
    #
    # Does a POST /deposit_switch/create call which creates a deposit switch
    #
    # target_account_id - ID of the bank account for the deposit switch
    # target_access_token - access token for the switch
    #
    # Returns the DepositSwitchResponse object with deposit switch data.
    def create(target_account_id, target_access_token)
      post_with_auth 'deposit_switch/create',
                    CreateResponse,
                    target_account_id: target_account_id,
                    target_access_token: target_access_token
    end
    # Public: Response wrapper for /deposit_switch/create.
    class CreateResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: The ID associated with the deposit switch
      property :deposit_switch_id
    end

    # Public: Create Deposit Switch token.
    #
    # Does a POST /deposit_switch/token/create call which creates a deposit
    # switch.
    #
    # deposit_switch_item - ID of the deposit switch
    #
    # Returns the CreateTokenResponse object.
    def create_token(deposit_switch_id)
      post_with_auth 'deposit_switch/token/create',
                    CreateTokenResponse,
                    deposit_switch_id: deposit_switch_id
    end
    # Public: Response wrapper for /deposit_switch/create.
    class CreateTokenResponse < Models::BaseResponse
      ##
      # :attr_reader:
      # Public: A deposit switch token for the deposit switch.
      property :deposit_switch_token

      ##
      # :attr_reader:
      # Public: The expiration time of the deposit switch token
      property :deposit_switch_token_expiration_time
    end
  end
end
