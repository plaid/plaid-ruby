# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Student loan repayment information used to configure Sandbox test data for the Liabilities product
    class StudentLoanRepaymentModel < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false

      field :non_repayment_months, -> { Float }, optional: false, nullable: false

      field :repayment_months, -> { Float }, optional: false, nullable: false
    end
  end
end
