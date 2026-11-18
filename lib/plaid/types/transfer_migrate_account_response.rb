# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/migrate_account`
    class TransferMigrateAccountResponse < Internal::Types::Model
      field :access_token, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
