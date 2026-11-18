# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing payroll data.
    class PayrollIncomeObject < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: true

      field :pay_stubs, -> { Internal::Types::Array[Plaid::Types::CreditPayStub] }, optional: false, nullable: false

      field :w2s, -> { Internal::Types::Array[Plaid::Types::CreditW2] }, optional: false, nullable: false

      field :form1099s, -> { Internal::Types::Array[Plaid::Types::Credit1099] }, optional: false, nullable: false

      field :i20s, -> { Internal::Types::Array[Plaid::Types::CreditI20] }, optional: false, nullable: false
    end
  end
end
