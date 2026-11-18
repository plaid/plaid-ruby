# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # metadata for the set of insights provided in `TransactionsUserInsightsGetResponse`
    class UserDataOverview < Internal::Types::Model
      field :transaction_count, -> { Integer }, optional: false, nullable: false

      field :oldest_transaction_date, -> { String }, optional: true, nullable: false

      field :newest_transaction_date, -> { String }, optional: true, nullable: false

      field :days_available, -> { Integer }, optional: false, nullable: false

      field :total_outflows, -> { Float }, optional: false, nullable: false

      field :total_inflows, -> { Float }, optional: false, nullable: false
    end
  end
end
