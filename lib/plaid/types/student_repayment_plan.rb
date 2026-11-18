# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the repayment plan for the student loan
    class StudentRepaymentPlan < Internal::Types::Model
      field :description, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::StudentRepaymentPlanType }, optional: false, nullable: true
    end
  end
end
