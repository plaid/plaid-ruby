module Plaid
  # Public: Class used to call the Stripe sub-product.
  class Stripe < BaseProduct
    # Public: Class used to call the BankAccountToken sub-product.
    class BankAccountToken < BaseProduct
      # Public: Creates a Stripe bank account token from an access_token.
      #
      # Does a POST /processor/stripe/bank_account_token/create call which can
      # be used to generate a Stripe bank account token for a given account
      # ID.
      #
      # access_token - access_token to create a public token for
      # account_id - ID of the account to create a bank account token for
      #
      # Returns CreateResponse object containing a Stripe bank account token.
      def create(access_token, account_id)
        post_with_auth 'processor/stripe/bank_account_token/create',
                       CreateResponse,
                       access_token: access_token, account_id: account_id
      end

      # Public: A response for /processor/stripe/bank_account_token/create.
      class CreateResponse < Models::BaseResponse
        ##
        # :attr_reader:
        # Public: The String stripe token.
        property :stripe_bank_account_token
      end
    end

    ##
    # :attr_reader:
    # Public: The Plaid::Stripe::BankAccountToken product accessor.
    subproduct :bank_account_token, BankAccountToken
  end

  # Public: A response for /processor/.../processor_token/create.
  class ProcessorTokenResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The String processor token.
    property :processor_token
  end

  # Public: Class used to call the Dwolla sub-product.
  class Dwolla < BaseProduct
    # Public: Class used to call the dwolla.processor_token subproduct
    class ProcessorToken < BaseProduct
      # Public: Creates a Dwolla processor token from an access_token.
      #
      # Does a POST /processor/dwolla/processor_token/create call which can be
      # used to generate a Dwolla processor token for a given account ID.
      #
      # access_token - access_token to create a public token for.
      # account_id - ID of the account to create a processor token for.
      #
      # Returns a ProcessorTokenResponse object containing a Dwolla processor
      # token.
      def create(access_token, account_id)
        post_with_auth 'processor/dwolla/processor_token/create',
                       ProcessorTokenResponse,
                       access_token: access_token,
                       account_id: account_id
      end
    end

    ##
    # :attr_reader:
    # Public: The Plaid::Dwolla::ProcessorToken product accessor.
    subproduct :processor_token, ProcessorToken
  end

  # Public: Class used to call the Apex sub-product.
  class Apex < BaseProduct
    # Public: Class used to call the apex.processor_token subproduct
    class ProcessorToken < BaseProduct
      # Public: Creates an Apex processor token from an access_token.
      #
      # Does a POST /processor/apex/processor_token/create call which can be
      # used to generate an Apex processor token for a given account ID.
      #
      # access_token - access_token to create a public token for.
      # account_id - ID of the account to create a processor token for.
      #
      # Returns a ProcessorTokenResponse object containing an Apex processor
      # token.
      def create(access_token, account_id)
        post_with_auth 'processor/apex/processor_token/create',
                       ProcessorTokenResponse,
                       access_token: access_token,
                       account_id: account_id
      end
    end

    ##
    # :attr_reader:
    # Public: The Plaid::ApexProcessorToken product accessor.
    subproduct :processor_token, ProcessorToken
  end

  # Public: Class used to call the Processor product.
  class Processor < BaseProduct
    ##
    # :attr_reader:
    # Public: The Plaid::Stripe product accessor.
    subproduct :stripe

    ##
    # :attr_reader:
    # Public: The Plaid::Dwolla product accessor.
    subproduct :dwolla

    ##
    # :attr_reader:
    # Public: The Plaid::Apex product accessor.
    subproduct :apex
  end
end
