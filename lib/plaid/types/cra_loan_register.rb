# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains loan data to register.
    class CraLoanRegister < Internal::Types::Model
      field :user_token, -> { String }, optional: false, nullable: false

      field :loan_id, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::CraLoanType }, optional: false, nullable: false

      field :payment_schedule, -> { Plaid::Types::CraLoanPaymentSchedule }, optional: false, nullable: false

      field :opened_date, -> { String }, optional: false, nullable: false

      field :opened_with_status, -> { Plaid::Types::CraLoanOpenedStatus }, optional: false, nullable: false

      field :loan_amount, -> { Float }, optional: true, nullable: false

      field :application, -> { Plaid::Types::CraLoanRegisterApplication }, optional: true, nullable: false
    end
  end
end
