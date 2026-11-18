# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to filter `/investments/transactions/get` results. If provided, must be non-`null`.
    class InvestmentsTransactionsGetRequestOptions < Internal::Types::Model
      field :account_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :count, -> { Integer }, optional: true, nullable: false

      field :offset, -> { Integer }, optional: true, nullable: false

      field :async_update, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
