# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # WalletCreateResponse defines the response schema for `/wallet/create`
    class WalletCreateResponse < Internal::Types::Model
      field :wallet_id, -> { String }, optional: false, nullable: false

      field :balance, -> { Plaid::Types::WalletBalance }, optional: false, nullable: false

      field :numbers, -> { Plaid::Types::WalletNumbers }, optional: false, nullable: false

      field :recipient_id, -> { String }, optional: true, nullable: false

      field :status, -> { Plaid::Types::WalletStatus }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
