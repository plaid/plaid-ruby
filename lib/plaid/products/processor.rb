module Plaid
  # Public: Class used to call the BankAccountToken sub-product.
  class BankAccountToken
    def initialize(client)
      @client = client
    end

    # Public: Creates a Stripe bank account token from an access_token.
    #
    # Does a POST /processor/stripe/bank_account_token/create call which can
    # be used to generate a Stripe bank account token for a given account ID.
    #
    # access_token - access_token to create a public token for
    # account_id - ID of the account to create a bank account token for
    #
    # Returns a parsed JSON containing a Stripe bank account token
    def create(access_token, account_id)
      payload = { access_token: access_token,
                  account_id: account_id }
      @client.post_with_auth('processor/stripe/bank_account_token/create',
                             payload)
    end
  end

  class ProcessorToken
    def initialize(client, sub_product)
      @client = client
      @sub_product = sub_product
    end

    # Public: Creates an processor token from an access_token for a specific sub-product.
    #
    # Does a POST /processor/[sub_product]/processor_token/create call which can
    # be used to generate a processor token for a given account ID.
    #
    # access_token - access_token to create a public token for
    # account_id - ID of the account to create a processor token for
    #
    # Returns a parsed JSON containing a processor token
    def create(access_token, account_id)
      payload = { access_token: access_token,
                  account_id: account_id }
      @client.post_with_auth("processor/#{@sub_product}/processor_token/create",
                             payload)
    end
  end

  # Public: Class used to call the Stripe sub-product.
  class Stripe
    # Public: Memoized class instance to make requests from Plaid::BankAccountToken
    def bank_account_token
      @bank_account_token ||= Plaid::BankAccountToken.new(@client)
    end

    def initialize(client)
      @client = client
    end
  end

  # Public: Class used to call the Apex sub-product.
  class Apex
    # Public: Memoized class instance to make requests from Plaid::ProcessorToken
    def processor_token
      @processor_token ||= Plaid::ProcessorToken.new(@client, :apex)
    end

    def initialize(client)
      @client = client
    end
  end

  # Public: Class used to call the Dwolla sub-product.
  class Dwolla
    # Public: Memoized class instance to make requests from Plaid::ProcessorToken
    def processor_token
      @processor_token ||= Plaid::ProcessorToken.new(@client, :dwolla)
    end

    def initialize(client)
      @client = client
    end
  end

  # Public: Class used to call the Processor product.
  class Processor
    # Public: Memoized class instance to make requests from Plaid::Stripe
    def stripe
      @stripe ||= Plaid::Stripe.new(@client)
    end

    # Public: Memoized class instance to make requests from Plaid::Apex
    def apex
      @apex ||= Plaid::Apex.new(@client)
    end

    # Public: Memoized class instance to make requests from Plaid::Dwolla
    def dwolla
      @dwolla ||= Plaid::Dwolla.new(@client)
    end

    def initialize(client)
      @client = client
    end
  end
end
