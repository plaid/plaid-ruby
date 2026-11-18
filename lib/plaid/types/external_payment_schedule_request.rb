# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The schedule that the payment will be executed on. If a schedule is provided, the payment is automatically set up
    # as a standing order. If no schedule is specified, the payment will be executed only once.
    class ExternalPaymentScheduleRequest < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false

      field :interval, -> { Plaid::Types::PaymentScheduleInterval }, optional: false, nullable: false

      field :interval_execution_day, -> { Integer }, optional: false, nullable: false

      field :end_date, -> { String }, optional: true, nullable: true

      field :adjusted_start_date, -> { String }, optional: true, nullable: true
    end
  end
end
