# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A transaction on the Employment Refresh Report. Note that this transaction differs from a Base Report transaction
    # in that it will only be deposits, and the amounts will be omitted.
    class CraEmploymentRefreshReportTransaction < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :original_description, -> { String }, optional: false, nullable: false

      field :date, -> { String }, optional: false, nullable: false

      field :pending, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :transaction_id, -> { String }, optional: false, nullable: false
    end
  end
end
