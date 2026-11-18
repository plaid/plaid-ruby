# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An SEC EDGAR registration the data provider linked to the business.
    class BusinessSecRegistration < Internal::Types::Model
      field :cik, -> { String }, optional: false, nullable: true

      field :tickers, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :exchanges, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :edgar_url, -> { String }, optional: false, nullable: true
    end
  end
end
