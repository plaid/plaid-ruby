# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Employment Refresh Report information about an account.
    class CraEmploymentRefreshReportAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :official_name, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :transactions, -> { Internal::Types::Array[Plaid::Types::CraEmploymentRefreshReportTransaction] }, optional: false, nullable: false
    end
  end
end
