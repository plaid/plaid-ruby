# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The number of inflow or outflow transactions on the account in one calendar month. This field will only be
    # included for depository accounts.
    class BaseReportNumberFlowInsights < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: false, nullable: false

      field :count, -> { Integer }, optional: false, nullable: false
    end
  end
end
