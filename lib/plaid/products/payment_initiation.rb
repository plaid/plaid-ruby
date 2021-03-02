module Plaid
  # Public: Class used to call the Payment product.
  class PaymentInitiation < BaseProduct
    # Public: Create a recipient.
    #
    # name    - Recipient name.
    # iban    - Recipient IBAN. Should be nil if using bacs.
    # address - Recipient address (hash with "street", "city", "postal_code"
    #           and "country"). Best practice is to set it as nil.
    # bacs    - Recipient BACS (hash with "account" and "sort_code" keys).
    #           Should be nil if using iban.
    #
    # Returns a PaymentRecipientCreateResponse object.
    def create_recipient(name, iban, address, bacs)
      post_with_auth 'payment_initiation/recipient/create',
                     PaymentRecipientCreateResponse,
                     name: name,
                     iban: iban,
                     bacs: bacs,
                     address: address
    end

    # Public: Retrieve a recipient.
    #
    # recipient_id - The recipient ID from the `create_recipient` response.
    #
    # Returns a PaymentRecipientGetResponse object.
    def get_recipient(recipient_id)
      post_with_auth 'payment_initiation/recipient/get',
                     PaymentRecipientGetResponse,
                     recipient_id: recipient_id
    end

    # Public: List all recipients.
    #
    # Returns a PaymentRecipientListResponse object.
    def list_recipients
      post_with_auth 'payment_initiation/recipient/list',
                     PaymentRecipientListResponse,
                     {}
    end

    # Public: Create a payment.
    #
    # recipient_id - Recipient ID that the payment will be initiated for.
    # reference    - Payment reference.
    # amount       - Payment amount.
    # schedule     - Payment schedule.
    #
    # Returns a PaymentCreateResponse object.
    def create_payment(recipient_id, reference, amount, schedule: nil)
      if schedule.nil?
        post_with_auth 'payment_initiation/payment/create',
                       PaymentCreateResponse,
                       recipient_id: recipient_id,
                       reference: reference,
                       amount: amount
      else
        post_with_auth 'payment_initiation/payment/create',
                       PaymentCreateResponse,
                       recipient_id: recipient_id,
                       reference: reference,
                       amount: amount,
                       schedule: schedule
      end
    end

    # Public: Create a payment token.
    #
    # payment_id - Payment ID that the token will be created for.
    #
    # Returns a PaymentTokenCreateResponse object.
    def create_payment_token(payment_id)
      puts 'Warning: this method will be deprecated in a future version. '\
           'To replace the payment_token, look into the link_token at '\
           'https://plaid.com/docs/api/tokens/#linktokencreate.'

      post_with_auth 'payment_initiation/payment/token/create',
                     PaymentTokenCreateResponse,
                     payment_id: payment_id
    end

    # Public: Retrieve a payment.
    #
    # payment_id - The payment ID from the `create_payment` response.
    #
    # Returns a PaymentGetResponse object.
    def get_payment(payment_id)
      post_with_auth 'payment_initiation/payment/get',
                     PaymentGetResponse,
                     payment_id: payment_id
    end

    # Public: List all payments.
    #
    # options - Object to specify optional parameters 'count' and 'cursor'.
    #           e.g {count: 10, cursor: '2019-12-06T22:35:49Z'} returns 10
    #           payments initiated before 2019-12-06T22:35:49Z.
    #
    # Returns a PaymentListResponse object.
    def list_payments(options)
      post_with_auth 'payment_initiation/payment/list',
                     PaymentListResponse,
                     options
    end
  end

  # Public: The response wrapper for /payment_initiation/recipient/create.
  class PaymentRecipientCreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The recipient ID.
    property :recipient_id
  end

  # Public: The response wrapper for /payment_initiation/recipient/get.
  class PaymentRecipientGetResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The recipient ID.
    property :recipient_id

    ##
    # :attr_reader:
    # Public: The recipient name.
    property :name

    ##
    # :attr_reader:
    # Public: The recipient IBAN.
    property :iban

    ##
    # :attr_reader:
    # Public: The recipient IBAN.
    property :bacs, coerce: Models::PaymentRecipientBACS

    ##
    # :attr_reader:
    # Public: The recipient address.
    property :address, coerce: Models::PaymentRecipientAddress
  end

  # Public: The response wrapper for /payment_initiation/recipient/list.
  class PaymentRecipientListResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The list of recipients.
    property :recipients, coerce: Array[Models::PaymentRecipient]
  end

  # Public: The response wrapper for /payment_initiation/payment/create.
  class PaymentCreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The payment ID.
    property :payment_id

    ##
    # :attr_reader:
    # Public: The payment status.
    property :status
  end

  # Public: The response wrapper for /payment_initiation/payment/token/create.
  class PaymentTokenCreateResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The payment token.
    property :payment_token

    ##
    # :attr_reader:
    # Public: The payment token's expiration time.
    property :payment_token_expiration_time
  end

  # Public: The response wrapper for /payment_initiation/payment/get.
  class PaymentGetResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The payment ID.
    property :payment_id

    ##
    # :attr_reader:
    # Public: The payment token.
    property :payment_token

    ##
    # :attr_reader:
    # Public: The payment reference.
    property :reference

    ##
    # :attr_reader:
    # Public: The payment amount.
    property :amount, coerce: Models::PaymentAmount

    ##
    # :attr_reader:
    # Public: The payment schedule.
    property :schedule, coerce: Models::PaymentSchedule

    ##
    # :attr_reader:
    # Public: The payment's status.
    property :status

    ##
    # :attr_reader:
    # Public: The last status update time for payment.
    property :last_status_update

    ##
    # :attr_reader:
    # Public: The payment token's expiration time.
    property :payment_token_expiration_time

    ##
    # :attr_reader:
    # Public: The recipient ID for payment.
    property :recipient_id
  end

  # Public: The response wrapper for /payment_initiation/payment/list.
  class PaymentListResponse < Models::BaseResponse
    ##
    # :attr_reader:
    # Public: The list of payments.
    property :payments, coerce: Array[Models::Payment]

    ##
    # :attr_reader:
    # Public: The cursor (its a timestamp) to use in the next
    # /payment_initiation/payment/list call for retrieving more older payments.
    property :next_cursor
  end
end
