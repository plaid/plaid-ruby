# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/originator/funding_account/create`
    class TransferOriginatorFundingAccountCreateResponse < Internal::Types::Model
      field :funding_account_id, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
