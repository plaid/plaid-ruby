# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object containing information about the payroll item.
    class PayrollItem < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :accounts, -> { Internal::Types::Array[Plaid::Types::PayrollIncomeAccountData] }, optional: false, nullable: false

      field :payroll_income, -> { Internal::Types::Array[Plaid::Types::PayrollIncomeObject] }, optional: false, nullable: false

      field :status, -> { Plaid::Types::PayrollItemStatus }, optional: false, nullable: true

      field :updated_at, -> { String }, optional: false, nullable: true
    end
  end
end
