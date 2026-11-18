# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The transactions data for the end user's income source(s).
    class CraBankIncomeTransaction < Internal::Types::Model
      field :transaction_id, -> { String }, optional: false, nullable: false

      field :amount, -> { Float }, optional: false, nullable: false

      field :date, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :original_description, -> { String }, optional: false, nullable: true

      field :pending, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :check_number, -> { String }, optional: true, nullable: true

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :bonus_type, -> { Plaid::Types::CraBankIncomeBonusType }, optional: true, nullable: true
    end
  end
end
