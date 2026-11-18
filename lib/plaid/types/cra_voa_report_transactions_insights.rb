# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Transaction data associated with the account.
    class CraVoaReportTransactionsInsights < Internal::Types::Model
      field :all_transactions, -> { Internal::Types::Array[Plaid::Types::BaseReportTransaction] }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: true

      field :start_date, -> { String }, optional: false, nullable: true
    end
  end
end
