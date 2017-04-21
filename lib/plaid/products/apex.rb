module Plaid
  # Public: Class used to call the Processor Token sub-product.
  class ProcessorToken
    def initialize(client)
      @client = client
    end

    # Public: Creates an Apex bank account token from an access_token.
    #
    # Does a POST /processor/apex/processor_token/create call which can
    # be used to generate a Apex bank account token for a given account ID.
    #
    # access_token - access_token to create a public token for
    # account_id - ID of the account to create a bank account token for
    #
    # Returns a parsed JSON containing a Apex bank account token
    def create(access_token, account_id)
      payload = { access_token: access_token,
                  account_id: account_id }
      @client.post_with_auth('processor/apex/processor_token/create ',
                             payload)
    end
  end

  # Public: Class used to call the Apex sub-product.
  class Apex
    # Public: Memoized class instance
    # to make requests from Plaid::ProcessorToken
    def processor_token
      @bank_account_token ||= Plaid::ProcessorToken.new(@client)
    end

    def initialize(client)
      @client = client
    end
  end

  # Public: Class used to call the Processor product.
  class Processor
    # Public: Memoized class instance to make requests from Plaid::Apex
    def apex
      @apex ||= Plaid::Apex.new(@client)
    end

    def initialize(client)
      @client = client
    end
  end
end
