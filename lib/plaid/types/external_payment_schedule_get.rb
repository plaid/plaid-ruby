# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The schedule that the payment will be executed on. If a schedule is provided, the payment is automatically set up
    # as a standing order. If no schedule is specified, the payment will be executed only once.
    class ExternalPaymentScheduleGet < Internal::Types::Model
      field :adjusted_start_date, -> { String }, optional: false, nullable: true

      field :end_date, -> { String }, optional: false, nullable: true

      field :interval, -> { Plaid::Types::PaymentScheduleInterval }, optional: false, nullable: false

      field :interval_execution_day, -> { Integer }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: false
    end
  end
end
