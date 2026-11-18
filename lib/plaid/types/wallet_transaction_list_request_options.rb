# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional wallet transaction options
    class WalletTransactionListRequestOptions < Internal::Types::Model
      field :start_time, -> { String }, optional: true, nullable: false

      field :end_time, -> { String }, optional: true, nullable: false
    end
  end
end
