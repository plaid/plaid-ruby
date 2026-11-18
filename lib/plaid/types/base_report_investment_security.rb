# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Investment security associated with the account.
    class BaseReportInvestmentSecurity < Internal::Types::Model
      field :security_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: true

      field :isin, -> { String }, optional: false, nullable: true

      field :cusip, -> { String }, optional: false, nullable: true

      field :institution_security_id, -> { String }, optional: false, nullable: true

      field :institution_id, -> { String }, optional: false, nullable: true

      field :ticker_symbol, -> { String }, optional: false, nullable: true

      field :type, -> { String }, optional: false, nullable: true
    end
  end
end
