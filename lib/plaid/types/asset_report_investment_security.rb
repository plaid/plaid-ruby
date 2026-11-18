# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Investment security associated with the account.
    class AssetReportInvestmentSecurity < Internal::Types::Model
      field :security_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true

      field :ticker_symbol, -> { String }, optional: false, nullable: true

      field :type, -> { String }, optional: false, nullable: true
    end
  end
end
