# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The schedule that the recurring transfer will be executed on.
    class TransferRecurringSchedule < Internal::Types::Model
      field :interval_unit, -> { Plaid::Types::TransferScheduleIntervalUnit }, optional: false, nullable: false

      field :interval_count, -> { Integer }, optional: false, nullable: false

      field :interval_execution_day, -> { Integer }, optional: false, nullable: false

      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: true, nullable: true
    end
  end
end
