module Plaid
  # Public: Representation of a webhook.
  class Webhook
    # Public: The String human readable explanation of this webhook request.
    # E.g. "Initial transaction pull finished".
    attr_reader :message

    # Public: The access token for authenticated user.
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
      @resolve = fields['resolve'] # present only for Error Response Webhook
    end

    # Public: Share the type of Webhook this is from its code
    #
    # Returns String webhook type
    def type
      Webhook::CODEX[@code] || 'ErrorResponse'
    end

    # Public: Detect if the webhook is Initial Transaction Webhook. Occurs
    # once the initial transaction pull has finished.
    #
    # Returns true if it is.
    def initial_transaction?
      code == Webhook::InitialTransaction
    end

    # Public: Detect if the webhook is Historical Transaction Webhook. Occurs
    # once the historical transaction pull has completed, shortly after the
    # initial transaction pull.
    #
    # Returns true if it is.
    def historical_transaction?
      code == Webhook::HistoricalTransaction
    end

    # Public: Detect if the webhook is Normal Transaction Webhook. Occurs at
    # set intervals throughout the day as data is updated from the financial
    # institutions.
    #
    # Returns true if it is.
    def normal_transaction?
      code == Webhook::NormalTransaction
    end

    # Public: Detect if the webhook is Removed Transaction Webhook. Occurs when
    # transactions have been removed from our system.
    #
    # Returns true if it is.
    def removed_transaction?
      code == Webhook::RemovedTransaction
    end

    # Public: Detect if the webhook is User's Webhook Updated. Occurs when an
    # user's webhook is updated via a PATCH request without credentials.
    #
    # Returns true if it is.
    def user_webhook_updated?
      code == Webhook::UserWebhookUpdated
    end

    # Public: Detect if the webhook is Error Response Webhook. Triggered when
    # an error has occurred. Includes the relevant Plaid error code with
    # details on both the error type and steps for error resolution.
    #
    # Returns true if it is.
    def error_response?
      Webhook::CODEX[code].nil?
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

    Webhook::InitialTransaction    = 0
    Webhook::HistoricalTransaction = 1
    Webhook::NormalTransaction     = 2
    Webhook::RemovedTransaction    = 3
    Webhook::UserWebhookUpdated    = 4
    Webhook::ErrorResponse         = -1

    Webhook::CODEX = {
      0 => 'InitialTransaction',
      1 => 'HistoricalTransaction',
      2 => 'NormalTransaction',
      3 => 'RemovedTransaction',
      4 => 'UserWebhookUpdated'
    }
  end
end
