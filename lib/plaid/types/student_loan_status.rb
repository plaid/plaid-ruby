# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing the status of the student loan
    class StudentLoanStatus < Internal::Types::Model
      field :end_date, -> { String }, optional: false, nullable: true

      field :type, -> { Plaid::Types::StudentLoanStatusType }, optional: false, nullable: true
    end
  end
end
