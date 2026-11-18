# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specify the security associated with the holding or investment transaction. When inputting custom security data to
    # the Sandbox, Plaid will perform post-data-retrieval normalization and enrichment. These processes may cause the
    # data returned by the Sandbox to be slightly different from the data you input. An ISO-4217 currency code and a
    # security identifier (`ticker_symbol`, `cusip`, or `isin`) are required.
    class SecurityOverride < Internal::Types::Model
      field :isin, -> { String }, optional: true, nullable: false

      field :cusip, -> { String }, optional: true, nullable: false

      field :sedol, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :ticker_symbol, -> { String }, optional: true, nullable: false

      field :currency, -> { String }, optional: false, nullable: false
    end
  end
end
