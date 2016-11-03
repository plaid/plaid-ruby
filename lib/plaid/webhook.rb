module Plaid
  # Public: Representation of a webhook.
  class Webhook
    # Public: The String human readable explanation of this webhook request.
    # E.g. "Initial transaction pull finished".
    attr_reader :message

    # Public: The String access token for authenticated user.
    attr_reader :access_token

    # Public: The Integer number of transactions available in Plaid.
    # E.g. 124
    attr_reader :total_transactions

    # Public: The Integer code denoting the type of webhook this is. E.g. 0
    attr_reader :code

    # Public: Initialize a Webhook instance.
    #
    # fields - The Hash with fields.
    def initialize(fields)
      @message = fields['message']
      @access_token = fields['access_token']
      @total_transactions = fields['total_transactions']
      @code = fields['code']
      # present only for Removed Transaction Webhook
      @removed_transactions = fields['removed_transactions']
      # present only for Error Response Webhook
      @resolve = fields['resolve']
    end

    # Public: Share the type of Webhook this is from its code
    #
    # Returns String webhook type
    def type
      Webhook::CODEX[code] || 'ERROR_RESPONSE'
    end

    # Public: Detect if the webhook is Initial Transaction Webhook. Occurs
    # once the initial transaction pull has finished.
    #
    # Returns true if it is.
    def initial_transaction?
      code == Webhook::INITIAL_TRANSACTION
    end

    # Public: Detect if the webhook is Historical Transaction Webhook. Occurs
    # once the historical transaction pull has completed, shortly after the
    # initial transaction pull.
    #
    # Returns true if it is.
    def historical_transaction?
      code == Webhook::HISTORICAL_TRANSACTION
    end

    # Public: Detect if the webhook is Normal Transaction Webhook. Occurs at
    # set intervals throughout the day as data is updated from the financial
    # institutions.
    #
    # Returns true if it is.
    def normal_transaction?
      code == Webhook::NORMAL_TRANSACTION
    end

    # Public: Detect if the webhook is Removed Transaction Webhook. Occurs when
    # transactions have been removed from our system.
    #
    # Returns true if it is.
    def removed_transaction?
      code == Webhook::REMOVED_TRANSACTION
    end

    # Public: Detect if the webhook is User's Webhook Updated. Occurs when an
    # user's webhook is updated via a PATCH request without credentials.
    #
    # Returns true if it is.
    def user_webhook_updated?
      code == Webhook::USER_WEBHOOK_UPDATED
    end

    # Public: Detect if the webhook is Income. Occurs when Income data is ready.
    #
    # Returns true if it is.
    def income?
      code == Webhook::INCOME
    end

    # Public: Detect if the webhook is Risk. Occurs when Risk data is ready.
    #
    # Returns true if it is.
    def risk?
      code == Webhook::RISK
    end

    # Public: Detect if the webhook is Error Response Webhook. Triggered when
    # an error has occurred. Includes the relevant Plaid error code with
    # details on both the error type and steps for error resolution.
    #
    # Returns true if it is.
    def error_response?
      Webhook::CODEX[code].nil?
    end

    # Public: Get transaction IDs that were removed.
    #
    # Returns Array[String] or nil
    def removed_transactions_ids
      @removed_transactions
    end

    # Public: Get a Plaid::Error instance if this is an Error Response Webhook
    #
    # Returns Plaid::Error or nil
    def error
      if error_response?
        Plaid::PlaidError.new @code, @message, @resolve
      end
    end

    # Public: Get a String representation of the transaction.
    #
    # Returns a String.
    def inspect
      "#<Plaid::Webhook type=#{type.inspect} code=#{code.inspect}, access_token=#{access_token.inspect}, " \
      "total_transactions=#{total_transactions.inspect}, message=#{message.inspect}>"
    end

    # Public: Get a String representation of the transaction.
    #
    # Returns a String.
    alias to_s inspect

    private

    ERROR_RESPONSE = -1

    codex = {}
    {
      'initial transaction'    => 0,
      'historical transaction' => 1,
      'normal transaction'     => 2,
      'removed transaction'    => 3,
      'user webhook updated'   => 4,
      'income'                 => 10,
      'risk'                   => 20
    }.each do |event, idx|
      name = event.split.map(&:upcase).join('_')
      codex[idx] = name
      const_set name, idx
    end
    CODEX = codex.freeze
  end
end
