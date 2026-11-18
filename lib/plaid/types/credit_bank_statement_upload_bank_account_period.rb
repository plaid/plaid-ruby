# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing data on the overall period of the statement.
    class CreditBankStatementUploadBankAccountPeriod < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: true

      field :end_date, -> { String }, optional: false, nullable: true

      field :starting_balance, -> { Float }, optional: false, nullable: true

      field :ending_balance, -> { Float }, optional: false, nullable: true
    end
  end
end
