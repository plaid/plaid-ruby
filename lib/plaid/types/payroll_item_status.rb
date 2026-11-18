# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details about the status of the payroll item.
    class PayrollItemStatus < Internal::Types::Model
      field :processing_status, -> { String }, optional: true, nullable: true
    end
  end
end
