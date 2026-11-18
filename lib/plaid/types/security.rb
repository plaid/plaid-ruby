# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains details about a security
    class Security < Internal::Types::Model
      field :security_id, -> { String }, optional: false, nullable: false

      field :isin, -> { String }, optional: false, nullable: true

      field :cusip, -> { String }, optional: false, nullable: true

      field :sedol, -> { String }, optional: false, nullable: true

      field :institution_security_id, -> { String }, optional: false, nullable: true

      field :institution_id, -> { String }, optional: false, nullable: true

      field :proxy_security_id, -> { String }, optional: false, nullable: true

      field :name, -> { String }, optional: false, nullable: true

      field :ticker_symbol, -> { String }, optional: false, nullable: true

      field :is_cash_equivalent, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :type, -> { String }, optional: false, nullable: true

      field :subtype, -> { String }, optional: true, nullable: true

      field :close_price, -> { Float }, optional: false, nullable: true

      field :close_price_as_of, -> { String }, optional: false, nullable: true

      field :update_datetime, -> { String }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :market_identifier_code, -> { String }, optional: false, nullable: true

      field :sector, -> { String }, optional: false, nullable: true

      field :industry, -> { String }, optional: false, nullable: true

      field :cfi_code, -> { String }, optional: false, nullable: true

      field :figi, -> { String }, optional: false, nullable: true

      field :option_contract, -> { Plaid::Types::OptionContract }, optional: false, nullable: true

      field :fixed_income, -> { Plaid::Types::FixedIncome }, optional: false, nullable: true
    end
  end
end
