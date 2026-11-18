# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A possible account detected to be associated with a transaction user.
    class DetectedAccount < Internal::Types::Model
      field :account_type, -> { String }, optional: false, nullable: true

      field :account_subtype, -> { String }, optional: false, nullable: true

      field :transaction_count, -> { Integer }, optional: false, nullable: false

      field :oldest_transaction_date, -> { String }, optional: true, nullable: false

      field :newest_transaction_date, -> { String }, optional: true, nullable: false

      field :newest_transaction_amount, -> { Float }, optional: true, nullable: false

      field :total_outflows, -> { Float }, optional: false, nullable: false

      field :total_inflows, -> { Float }, optional: false, nullable: false
    end
  end
end
