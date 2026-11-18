# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A set of fields describing the balance for an account. Balance information may be cached unless the balance object
    # was returned by `/accounts/balance/get`.
    class AssetReportAccountBalance < Internal::Types::Model
      field :available, -> { Float }, optional: false, nullable: true

      field :current, -> { Float }, optional: false, nullable: true

      field :limit, -> { Float }, optional: false, nullable: true

      field :margin_loan_amount, -> { Float }, optional: false, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :last_updated_datetime, -> { String }, optional: true, nullable: true
    end
  end
end
