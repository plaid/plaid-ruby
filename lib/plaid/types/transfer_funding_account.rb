# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The originator's funding account, linked with Plaid Link or `/transfer/migrate_account`.
    class TransferFundingAccount < Internal::Types::Model
      field :access_token, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false
    end
  end
end
