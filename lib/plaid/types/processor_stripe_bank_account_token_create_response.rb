# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorStripeBankAccountTokenCreateResponse defines the response schema for
    # `/processor/stripe/bank_account_token/create`
    class ProcessorStripeBankAccountTokenCreateResponse < Internal::Types::Model
      field :stripe_bank_account_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
