# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration parameters for the Transactions product
    class LinkTokenTransactions < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: true, nullable: false
    end
  end
end
