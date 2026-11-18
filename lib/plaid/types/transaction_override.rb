# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data to populate as test transaction data. If not specified, random transactions will be generated instead.
    class TransactionOverride < Internal::Types::Model
      field :date_transacted, -> { String }, optional: false, nullable: false

      field :date_posted, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :description, -> { String }, optional: false, nullable: false

      field :currency, -> { String }, optional: true, nullable: false
    end
  end
end
