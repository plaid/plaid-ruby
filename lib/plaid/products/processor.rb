module Plaid
  # Public: Class used to call the BankAccountToken sub-product.
  class BankAccountToken < BaseProduct
    # Public: Creates a Stripe bank account token from an access_token.
    #
    # Does a POST /processor/stripe/bank_account_token/create call which can be
    # used to generate a Stripe bank account token for a given account ID.
    #
    # access_token - access_token to create a public token for
    # account_id - ID of the account to create a bank account token for
    #
    # Returns a parsed JSON containing a Stripe bank account token
    def create(access_token, account_id)
      post_with_auth('processor/stripe/bank_account_token/create',
                     CreateResponse,
                     access_token: access_token, account_id: account_id)
    end

    class CreateResponse < Models::BaseResponse
      # Public: The String stripe token.
      property :stripe_bank_account_token
    end
  end

  # Public: Class used to call the Stripe sub-product.
  class Stripe < BaseProduct
    ##
    # Public: The Plaid::BankAccountToken product accessor.
    subproduct :bank_account_token
  end

  # Public: Class used to call the Processor product.
  class Processor < BaseProduct
    ##
    # Public: The Plaid::Stripe product accessor.
    subproduct :stripe
  end
end
